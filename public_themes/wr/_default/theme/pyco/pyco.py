# coding=utf-8
from __future__ import absolute_import

import os
import sys

from flask import Flask, current_app, request, make_response, g
from flask.json import JSONEncoder

from utils.request import get_remote_addr, get_request_url
from utils.response import make_cors_headers

from loaders import load_config, load_plugins, load_all_files, load_curr_app
from analyzer import SimpleAnalyzer
from blueprints import register_blueprints


__version_info__ = ('2', '7', '7')
__version__ = '.'.join(__version_info__)


# create app
app = Flask(__name__)
app.version = __version__

load_config(app)

# make importable for plugin folder
BASE_DIR = os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, os.path.join(BASE_DIR, app.config.get("PLUGIN_DIR")))

# init app
app.debug = app.config.get("DEBUG", True)
app.template_folder = os.path.join(app.config.get("THEMES_DIR"),
                                   app.config.get("THEME_NAME"))

app.static_folder = app.config.get("THEMES_DIR")
app.static_url_path = "/{}".format(app.config.get("STATIC_PATH"))

# jinja env
app.jinja_env.autoescape = False
app.jinja_env.finalize = lambda x: '' if hasattr(x, '__call__') else x
app.jinja_env.add_extension('jinja2.ext.loopcontrols')
app.jinja_env.add_extension('jinja2.ext.do')
app.jinja_env.add_extension('jinja2.ext.with_')

# encoder
app.json_encoder = JSONEncoder
# config
load_config(app)
# plugins
load_plugins(app)
# analyzer
app.sa_mod = SimpleAnalyzer()

# register blueprints
register_blueprints(app)

# static
app.add_url_rule(
    app.static_url_path + '/<path:filename>',
    view_func=app.send_static_file,
    endpoint='static'
)


SYS_ICON_LIST = ['favicon.ico',
                 'apple-touch-icon-precomposed.png',
                 'apple-touch-icon.png']


@app.before_request
def app_before_request():
    # cors response
    if request.method == "OPTIONS":
        resp = current_app.make_default_options_response()
        cors_headers = make_cors_headers()
        resp.headers.extend(cors_headers)
        return resp
    elif request.path.strip("/") in SYS_ICON_LIST:
        return make_response('', 204)  # for browser default icons

    if request.endpoint == 'uploads.get_uploads':
        return

    base_url = current_app.config.get("BASE_URL")
    uploads_dir = current_app.config.get("UPLOADS_DIR")

    g.curr_app = load_curr_app(current_app)
    g.files = load_all_files(current_app, g.curr_app)
    g.curr_base_url = base_url

    g.request_remote_addr = get_remote_addr()
    g.request_path = request.path

    g.request_url = get_request_url(g.curr_base_url, g.request_path)
    g.uploads_url = "{}/{}".format(base_url, uploads_dir)

    g.query_count = 0


if __name__ == "__main__":
    host = app.config.get("HOST")
    port = app.config.get("PORT")

    print "-------------------------------------------------------"
    print "Pyco: {}".format(app.version)
    print "-------------------------------------------------------"

    if app.debug:
        debug_msg = "\n".join(["Pyco is running in DEBUG mode !!!",
                               "Jinja2 template folder is about to reload."])
        print(debug_msg)

    app.run(host=host, port=port, debug=True, threaded=True)
