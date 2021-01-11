#!/bin/bash

start_php_fpm() {
  if [ $PHP_VERSION = "7.1" ]
  then
    service php7.1-fpm start
  elif [ $PHP_VERSION = "7.2" ]
  then
    service php7.2-fpm start
  elif [ $PHP_VERSION = "7.3" ]
  then
    service php7.3-fpm start
  elif [ $PHP_VERSION = "7.4" ]
  then
    service php7.4-fpm start
  fi
}

start_web_server() {
  if [ $WEB_SERVER = "nginx" ]
  then
    start_php_fpm && nginx -g 'daemon off;'
  elif [ $WEB_SERVER = "apache_prefork" ]
  then
    apachectl -e info -DFOREGROUND
  elif [ $WEB_SERVER = "apache_fpm" ]
  then
    start_php_fpm && apachectl -e info -DFOREGROUND
  fi
}

start_cron() {
  cron -f
}

start_cron
start_web_server