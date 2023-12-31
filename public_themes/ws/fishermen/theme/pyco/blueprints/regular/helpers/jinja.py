# coding=utf-8
from __future__ import absolute_import

from flask import current_app, request, g
from itertools import groupby
import os
import datetime
import urlparse

from utils.validators import url_validator
from utils.model import make_dotted_dict
from utils.misc import (sortedby,
                        parse_int,
                        parse_dateformat,
                        get_url_params,
                        add_url_params,
                        match_cond,
                        convert_price,
                        chunks,
                        now)


# filters
def filter_thumbnail(pic_url, preset_name=u'default'):
    if not isinstance(pic_url, basestring) or \
       not pic_url.startswith(g.uploads_url):
        return pic_url

    presets = (
        'default',
        'retina',
        'favicon',
        'icon')

    preset = preset_name if preset_name in presets else presets[0]

    try:
        _ext = os.path.splitext(pic_url.split('?', 1)[0])[1][1:].lower()
    except Exception:
        _ext = None
    if _ext in current_app.config['IMAGE_MEDIA_EXTS']:
        pair = '&' if '?' in pic_url else '?'
        pic_url = '{}{}thumbnail={}'.format(pic_url, pair, preset)
    return pic_url


def filter_timestamp(url, updated=None, key=u't'):
    if updated is None:
        updated = now()
    return add_url_params(url, {key: updated}, unique=True)


def filter_url(url, remove_args=False, remove_hash=False):
    if not isinstance(url, basestring):
        return url or u''
    if remove_args:
        url = url.split('?')[0]
    if remove_hash:
        url = url.split('#')[0]
    if not url or url_validator(url):
        return url
    elif url.startswith('/'):
        return u'{}/{}'.format(g.curr_base_url, url.strip('/'))
    else:
        return url.rstrip('/')


def filter_path(url, remove_args=True, remove_hash=True):
    if not isinstance(url, basestring):
        return url or u''
    if remove_args:
        url = url.split('?')[0]
    if remove_hash:
        url = url.split('#')[0]
    try:
        path = url.split(g.curr_base_url)[-1]
    except Exception:
        path = url

    return u'/{}'.format(path.strip('/'))


def filter_active(menu_item, path, match_nodes=False,
                  active='active', inactive=''):
    if not isinstance(menu_item, dict) or not isinstance(path, basestring):
        return inactive

    def _check_active(item):
        if path == item.get('path'):
            return True
        elif item.get('path_scope'):
            path_scope = item.get('path_scope').strip('/')
            if path.startswith(u'/{}/'.format(path_scope)):
                return True
        return False

    if _check_active(menu_item):
        return active

    if match_nodes and menu_item.get('nodes'):
        for node in menu_item['nodes']:
            if _check_active(node):
                return active
    return inactive


def filter_args(url, unique=True):
    if not isinstance(url, basestring):
        args = {}
    else:
        args = get_url_params(url, unique)
    return make_dotted_dict(args)


def filter_date_formatted(date, to_format=None):
    if not date:
        return ''
    if not isinstance(to_format, basestring):
        to_format = None

    formats = {
        'en': u'%B %d, %Y',
        'zh': u'%Y年 %m月 %d日',
    }

    try:
        locale = g.curr_app['locale']
        lang = locale.split('_')[0]
    except Exception:
        locale = None
        lang = None

    to_format = to_format or formats.get(locale) or formats.get(lang)
    return parse_dateformat(date, to_format)


def filter_background_image(src):
    if not src:
        return u''
    return u'background-image:url({});'.format(src)


def filter_column_offset(data, pattern=None, column=4, row_columns=12):
    row_columns = parse_int(row_columns, 12, 0)
    column = parse_int(column, 4, True)

    if isinstance(pattern, basestring):
        if '{}' not in pattern:
            pattern += '{}'
    else:
        pattern = None

    length = len(data) if isinstance(data, list) else parse_int(data, 0, 0)
    offset = int((row_columns - length * column) / 2)
    if pattern:
        if offset > 0:
            output = pattern.format(offset)
        else:
            output = ''
    else:
        output = offset
    return output


def filter_price(amount, use_currency=False, symbol=u'', fraction_size=2):
    return convert_price(amount, use_currency, symbol, fraction_size)


# jinja helpers
def saltshaker(raw_salts, conditions, limit=None, sort_by=None,
               intersection=True):
    """return a list of results matched conditions.
    result_pages = saltshaker(pages, [{'type':'test'},'thumbnail'],
                              limit=12, intersection=True, sort_by='updated')
    """
    if not isinstance(raw_salts, (list, dict)):
        return []
    elif isinstance(raw_salts, dict):
        salts = []
        for k, v in raw_salts.iteritems():
            v['_saltkey'] = k
            salts.append(v)
    else:
        salts = raw_salts

    if not isinstance(conditions, (basestring, dict)):
        conditions = [conditions]
    elif not isinstance(conditions, list):
        conditions = []

    results = []

    for cond in conditions[:5]:
        opposite = False
        force = False
        cond_key = None
        cond_value = ''
        if isinstance(cond, (basestring)):
            cond_key = cond.lower()
        elif isinstance(cond, dict):
            opposite = bool(cond.pop('not', False))
            force = bool(cond.pop('force', False))
            if cond:
                cond_key = cond.keys()[0]
                cond_value = cond[cond_key]
            else:
                continue

        if cond_key is None:
            continue

        if intersection and results:
            c_k = cond_key
            c_v = cond_value
            results = [i for i in results
                       if match_cond(i, c_k, c_v, force, opposite)]
        else:
            for i in salts:
                _mch = match_cond(i, cond_key, cond_value, force, opposite)
                if i not in results and _mch:
                    results.append(i)
    # sort by
    if sort_by:
        results = sortedby(results, sort_by)

    # limit
    if limit > 0:
        results = results[0:limit]
        # do not limit in loop, because results is not settled down.
    return results


def magnet(raw_list, current, limit=1):
    curr_idx = None

    for idx, p in enumerate(raw_list):
        p_id = p.get('id')
        if p_id and p_id == current.get('id'):
            curr_idx = idx
            break

    before_list = []
    after_list = []
    if curr_idx is not None:
        before_list = raw_list[max(curr_idx - limit, 0):curr_idx]
        after_list = raw_list[curr_idx + 1:curr_idx + 1 + limit]

    before = before_list[-1] if before_list else None
    after = after_list[0] if after_list else None

    return {
        'before': before,
        'after': after,
        'entries_before': before_list,
        'entries_after': after_list,
    }


def straw(raw_list, value, key='id', recursive_key='nodes', limit=600):
    """return a item matched with key/value form a list.
    some_page = straw(pages, some_id, key='id',
                      recursive_key='nodes', limit=600)
    """
    if not isinstance(key, basestring):
        key = 'id'
    if not isinstance(recursive_key, basestring):
        recursive_key = None

    limit = min(parse_int(limit), 600)

    def _find(items, level=0):
        if not isinstance(items, list) or level > 2:
            return None
        for item in items[:limit]:
            if item.get(key) == value:
                return item
            if recursive_key and item.get(recursive_key):
                node = _find(item[recursive_key], level + 1)
                if node:
                    return node
        return None

    return _find(raw_list, 0)


def glue(args=None, url=None, clarify=False, unique=True):
    """return a url with added args.
    relative_path_args = glue({'key': 'value'})
    `category` is alias for term.
    `page` is alias for paged.
    """
    if isinstance(args, dict):
        args['term'] = args.pop('category', args.get('term')) or None
        args['paged'] = args.pop('page', args.get('paged')) or None
        args = {k: v for k, v in args.iteritems() if v is not None}
    else:
        args = {}

    if not url:
        url = g.request_url

    if clarify:
        result = urlparse.urlparse(url)
        url = u'{r.scheme}://{r.netloc}{r.path}'.format(r=result)

    return add_url_params(url, args, unique=unique)


def timemachine(raw_list, field='date', precision='month',
                time_format='%Y-%m-%d', reverse=True):
    """return list of pages grouped by datetime.
    sorted_pages = timemachine(pages, field='date', precision='month',
                               time_format='%Y-%m-%d',reverse=True)
    """
    get_group_key = {
        'year': lambda x: x.year,
        'month': lambda x: (x.year, x.month),
        'day': lambda x: (x.year, x.month, x.day),
        'hour': lambda x: (x.month, x.day, x.hour, x.minute),
        'minute': lambda x: (x.month, x.day, x.hour, x.minute),
        'second': lambda x: (x.month, x.day, x.hour, x.minute, x.second)
    }

    def parse_datetime(date):
        if isinstance(date, basestring):
            date = datetime.datetime.strptime(date, time_format)
        elif isinstance(date, int):
            date = datetime.datetime.fromtimestamp(date)
        elif isinstance(date, datetime.datetime):
            date = date
        else:
            raise ValueError('invalid date format.')
        try:
            return get_group_key.get(precision, 'month')(date)
        except Exception:
            raise ValueError('invalid precision, precision must be str.')

    pages = sorted(filter(lambda x: x.get(field), raw_list),
                   key=lambda x: x[field],
                   reverse=reverse)

    # iterator version
    # return groupby(pages, key=lambda x: parse_datetime(x.get('date')))

    # list version
    ret = []
    raw_group = groupby(pages, key=lambda x: parse_datetime(x.get(field)))
    for date, group in raw_group:
        ret.append({
            'date': date,
            'contents': [x for x in group]
        })

    return ret


def stapler(raw_list, group_size=12, round_mode=False):
    groups = list(chunks(raw_list, group_size))
    if round_mode and len(groups) > 1 and len(groups[-1]) < group_size:
        groups = groups[:-1]
    return groups
