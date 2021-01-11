FROM ubuntu:20.04

ARG PHP_VERSION=7.4
ARG WEB_SERVER=apache_fpm
ARG SITE_NAME="SeedmeLab Quickstart"

# Also set the build args as environment variables
ENV PHP_VERSION=$PHP_VERSION
ENV WEB_SERVER=$WEB_SERVER
ENV SITE_NAME=$SITE_NAME

ARG DB_ROOT_PASS=drupal
ARG DB_USER=drupal
ARG DB_PASS=drupal

ENV DB_ROOT_PASS=$DB_ROOT_PASS
ENV DB_USER=$DB_USER
ENV DB_PASS=$DB_PASS

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && apt-get install -y curl vim zip unzip git wget cron

# Install PHP
ADD scripts/build/install_php.sh /scripts/build/install_php.sh
RUN chmod +x /scripts/build/*.sh
RUN /scripts/build/install_php.sh

ADD conf/php.ini /etc/php/$PHP_VERSION/fpm/php.ini

# Install Composer
ADD scripts/build/install_composer.sh /scripts/build/install_composer.sh
RUN chmod +x /scripts/build/*.sh
RUN /scripts/build/install_composer.sh

# Download drupal
ARG DRUPAL_SITE_DIR=/var/www
ARG DRUPAL_ADMIN_PASS=admin
ARG DRUPAL_DEMO_PASS=demo
ARG DRUPAL_DEMO_USER=demo

ENV DRUPAL_SITE_DIR=$DRUPAL_SITE_DIR
ENV DRUPAL_ADMIN_PASS=$DRUPAL_ADMIN_PASS
ENV DRUPAL_DEMO_PASS=$DRUPAL_DEMO_PASS
ENV DRUPAL_DEMO_USER=$DRUPAL_DEMO_USER

ENV PATH=$DRUPAL_SITE_DIR/vendor/bin/:$PATH

ADD scripts/build/download_drupal.sh /scripts/build/download_drupal.sh
RUN chmod +x /scripts/build/*.sh
RUN /scripts/build/download_drupal.sh

# Install web server
ADD scripts/build/install_webserver.sh /scripts/build/install_webserver.sh
RUN chmod +x /scripts/build/*.sh
RUN /scripts/build/install_webserver.sh

# Web server conf files
COPY conf/apache_vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY conf/php${PHP_VERSION}_fpm.conf /etc/apache2/conf-available/php-fpm.conf

# configure web server
ADD scripts/build/configure_webserver.sh /scripts/build/configure_webserver.sh
RUN chmod +x /scripts/build/*.sh
RUN /scripts/build/configure_webserver.sh

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD scripts/install /scripts/install
RUN chmod +x /scripts/install/*.sh

# Configure cron
ADD conf/drush.crontab /var/drush.crontab
RUN crontab /var/drush.crontab

WORKDIR $DRUPAL_SITE_DIR
ENTRYPOINT /entrypoint.sh