# coding=utf-8
from __future__ import absolute_import
import multiprocessing

bind = '127.0.0.1:9011'
workers = multiprocessing.cpu_count() * 2 + 1
accesslog = '/var/log/pyco/pyco_admin_zh.access.log'
errorlog = '/var/log/pyco/pyco_admin_zh.error.log'
pidfile = '/var/log/pyco/pyco_admin_zh.pid'
raw_env = ''
