#!/bin/sh

service php7.3-fpm start
service nginx start
service mysql start

sleep infinity && wait
