# coding=utf-8
from __future__ import absolute_import

from flask import Blueprint
from utils.misc import route_inject
from .routes import urlpatterns

bp_name = "uploads"

blueprint = Blueprint(bp_name, __name__)
route_inject(blueprint, urlpatterns)
