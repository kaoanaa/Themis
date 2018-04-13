#!/bin/bash

cd /home/themis-test/Themis
source /home/themis-test/python-project/bin/activate
supervisord -c /home/themis-test/Themis/script/supervisord.conf
