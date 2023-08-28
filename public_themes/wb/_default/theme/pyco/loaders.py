# coding=utf8
from __future__ import absolute_import

from flask import current_app
from utils.misc import process_slug, remove_multi_space

from types import ModuleType
import os
import yaml
import re
import json
import markdown


def load_config(app, config_name='config.py'):
    app.config.from_pyfile(config_name)
    app.config.setdefault('DEBUG', False)
    app.config.setdefault('STATIC_PATH', 'static')
    app.config.setdefault('UPLOADS_DIR', 'uploads')
    app.config.setdefault('CONTENT_DIR', 'content')
    app.config.setdefault('CONTENT_FILE_EXT', '.md')

    app.config.setdefault('BASE_URL', '/')
    app.config.setdefault('LIBS_URL', '')
    app.config.setdefault('THEME_URL', '')
    app.config.setdefault('API_BASEURL', '')

    app.config.setdefault('PLUGINS', [])
    app.config.setdefault('INVISIBLE_PAGE_LIST', [])
    app.config.setdefault('THEME_NAME', 'default')
    app.config.setdefault('HOST', '0.0.0.0')
    app.config.setdefault('PORT', 5500)
    app.config.setdefault('SITE', {})
    app.config.setdefault('THEME_META', {})
    app.config.setdefault('SYS_ICON_LIST', [])

    app.config.setdefault('PLUGIN_DIR', 'plugins')
    app.config.setdefault('THEMES_DIR', 'themes')
    app.config.setdefault('TEMPLATE_FILE_EXT', '.html')
    app.config.setdefault('TPL_FILE_EXT', '.tpl')

    app.config.setdefault('SITE_DATA_FILE', 'site.json')
    app.config.setdefault('THEME_CONF_FILE', 'config.json')

    app.config.setdefault('DEFAULT_TEMPLATE', 'index')
    app.config.setdefault('DEFAULT_DATE_FORMAT', '%Y-%m-%d')
    app.config.setdefault('DEFAULT_EXCERPT_LENGTH', 162)
    app.config.setdefault('DEFAULT_EXCERPT_ELLIPSIS', '&hellip;')

    app.config.setdefault('DEFAULT_INDEX_SLUG', 'index')
    app.config.setdefault('DEFAULT_404_SLUG', 'error-404')
    app.config.setdefault('DEFAULT_SEARCH_SLUG', 'search')
    app.config.setdefault('DEFAULT_TAXONOMY_SLUG', 'taxonomy')
    app.config.setdefault('DEFAULT_TAG_SLUG', 'tag')

    app.config.setdefault('RESERVED_SLUGS',
                          ['index', 'error-404', 'search', 'taxonomy', 'tag'])

    app.config.setdefault('SORTABLE_FIELD_KEYS', [])
    app.config.setdefault('STRUCTURE_FIELD_KEYS', [])
    app.config.setdefault('SHORT_FIELD_KEYS', {})

    app.config.setdefault('MAXIMUM_QUERY', 60)
    app.config.setdefault('MAXIMUM_INTACT_QUERY', 60)


def load_plugins(app):
    plugins = app.config.get('PLUGINS')
    loaded_plugins = []
    for module_or_module_name in plugins:
        if type(module_or_module_name) is ModuleType:
            loaded_plugins.append(module_or_module_name)
        elif isinstance(module_or_module_name, basestring):
            try:
                module = __import__(module_or_module_name)
            except ImportError as err:
                raise err
            loaded_plugins.append(module)
    app.plugins = loaded_plugins


def load_all_files(app, curr_app):
    content_dir = app.config.get('CONTENT_DIR')
    content_ext = app.config.get('CONTENT_FILE_EXT')

    all_files = []
    for root, directory, files in os.walk(content_dir):
        file_full_paths = [
            os.path.join(root, f)
            for f in filter(lambda x: x.endswith(content_ext), files)
        ]
        all_files.extend(file_full_paths)

    data_list = []
    for f in all_files:
        relative_path = f.split(content_dir + '/', 1)[1]
        if relative_path.startswith('_'):
            continue

        with open(f, 'r') as fh:
            readed = fh.read().decode('utf-8')
        meta_string, content_string = _content_splitter(readed)
        try:
            meta = _file_headers(meta_string)
        except Exception as e:
            e.current_file = f
            raise e

        file_data = {
            '_id': _auto_id(f),
            'app_id': curr_app['_id'],
            'slug': _auto_page_slug(f),
            'content_type': _auto_content_type(f),
            'priority': meta.pop('priority', 0),
            'parent': meta.pop('parent', u''),
            'date': meta.pop('date', u''),
            'taxonomy': meta.pop('taxonomy', {}),
            'tags': meta.pop('tags', []),
            'redirect': meta.pop('redirect', u''),
            'template': meta.pop('template', _auto_content_type(f)),
            'status': meta.pop('status', 1),
            'meta': meta,
            'searching': _make_searching_words(meta),
            'excerpt': _make_excerpt(content_string),
            'content': content_string,
            'updated': _auto_file_updated(f),
            'creation': _auto_file_creation(f),
        }
        data_list.append(file_data)

    return data_list


def load_curr_app(app):
    theme_meta_file = os.path.join(app.config.get('THEMES_DIR'),
                                   app.config.get('THEME_NAME'),
                                   app.config.get('THEME_CONF_FILE'))
    site_file = os.path.join(app.config.get('CONTENT_DIR'),
                             app.config.get('SITE_DATA_FILE'))

    try:
        with open(theme_meta_file) as theme_data:
            theme_meta = json.load(theme_data)
    except Exception as e:
        err_msg = 'Load Theme Meta faild: {}'.format(str(e))
        raise Exception(err_msg)

    try:
        with open(site_file) as site_data:
            site_json_str = site_data.read().decode('utf-8')
            site = json.loads(_shortcode(site_json_str))
    except Exception as e:
        err_msg = 'Load Site Meta faild: {}'.format(str(e))
        raise Exception(err_msg)

    site_meta = site.get('meta', {})

    return {
        '_id': site.get('app_id', 'pyco_app'),
        'slug': site.get('slug', 'pyco'),
        'type': site.get('type', 'ws'),
        'locale': site.get('locale', 'en_US'),
        'content_types': site.get('content_types', {'page': 'Pages'}),
        'taxonomies': site.get('taxonomies', None),
        'menus': site.get('menus', None),
        'slots': site.get('slots', {}),
        'meta': site_meta,
        'segments': site.get('segments', []),
        'socials': site_meta.pop('socials', None),
        'translates': site_meta.pop('translates', None),
        'theme_meta': theme_meta
    }


# helpers
def _content_splitter(file_content):
    file_content = _shortcode(file_content)
    pattern = r'(\n)*/\*(\n)*(?P<meta>(.*\n)*)\*/(?P<content>(.*(\n)?)*)'
    re_pattern = re.compile(pattern)
    m = re_pattern.match(file_content)
    if m is None:
        return '', ''
    return m.group('meta'), m.group('content')


def _shortcode(text):
    config = current_app.config
    re_uploads_dir = re.compile(r'\[\%uploads\%\]', re.IGNORECASE)
    re_theme_dir = re.compile(r'\[\%theme\%\]', re.IGNORECASE)
    # uploads
    uploads_dir = '{}/{}'.format(config['BASE_URL'], config['UPLOADS_DIR'])
    text = re.sub(re_uploads_dir, unicode(uploads_dir), text)
    # theme
    text = re.sub(re_theme_dir, unicode(config['THEME_URL']), text)
    return text


def _auto_file_updated(file_path):
    return int(os.path.getmtime(file_path))


def _auto_file_creation(file_path):
    return int(os.path.getctime(file_path))


def _auto_content_type(file_path, default_type=u'page'):
    path_parts = file_path.split('/')
    if len(path_parts) > 2:
        content_type = path_parts[1].lower()
    else:
        content_type = default_type
    return content_type


def _auto_id(file_path):
    content_dir = current_app.config.get('CONTENT_DIR')
    page_id = file_path.replace(content_dir + '/', '', 1).lstrip('/')
    return page_id


def _auto_page_slug(file_path):
    content_ext = current_app.config.get('CONTENT_FILE_EXT')
    if file_path.endswith(content_ext):
        file_path = os.path.splitext(file_path)[0]
    slug = file_path.split('/')[-1]
    return process_slug(slug)


def _file_headers(meta_string):
    def convert_data(x):
        if isinstance(x, dict):
            return dict((k.lower(), convert_data(v))
                        for k, v in x.iteritems())
        elif isinstance(x, list):
            return list([convert_data(i) for i in x])
        elif isinstance(x, str):
            return x.decode('utf-8')
        elif isinstance(x, (unicode, int, float, bool)) or x is None:
            return x
        else:
            try:
                x = str(x).decode('utf-8')
            except Exception as e:
                print e
                pass
        return x
    yaml_data = yaml.safe_load(meta_string)
    headers = convert_data(yaml_data)
    return headers


def _make_excerpt(content_string, length=600):
    use_markdown = current_app.config.get('USE_MARKDOWN')
    if use_markdown:
        markdown_exts = current_app.config.get('MARKDOWN_EXTENSIONS', [])
        content = markdown.markdown(content_string, markdown_exts)
    else:
        content = content_string
    excerpt = re.sub(r'<[^>]*?>', '', content)
    return excerpt[:length].strip()


def _make_searching_words(meta):
    title = meta.get('title', u'')
    des = meta.get('description', u'')
    try:
        text = remove_multi_space(u'{} {}'.format(title, des)[:600])
    except Exception:
        text = u''
    return text
