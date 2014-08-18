#!/usr/bin/env bash

erb config/nginx.conf.erb > config/nginx.conf

mkdir -p logs/nginx
touch logs/nginx/access.log logs/nginx/error.log

(tail -f -n 0 logs/nginx/*.log &)

exec vendor/nginx/sbin/nginx -p . -c config/nginx.conf
