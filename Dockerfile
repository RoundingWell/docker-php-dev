FROM roundingwell/php-fpm:latest

MAINTAINER devops@roundingwell.com

RUN apk --update --no-cache add \
    php7-pecl-xdebug

COPY php.ini /etc/php7/conf.d/20-development.ini
COPY xdebug.ini /etc/php7/conf.d/xdebug.ini
