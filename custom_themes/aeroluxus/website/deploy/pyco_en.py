# coding=utf-8
from __future__ import absolute_import
import multiprocessing

bind = '127.0.0.1:9000'
workers = multiprocessing.cpu_count() * 2 + 1
accesslog = '/var/log/pyco/pyco_en.access.log'
errorlog = '/var/log/pyco/pyco_en.error.log'
pidfile = '/var/log/pyco/pyco_en.pid'
raw_env = ''
