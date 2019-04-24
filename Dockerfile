FROM roundingwell/php-fpm:latest

MAINTAINER devops@roundingwell.com

USER root:root

RUN apk --update --no-cache add \
    composer \
    git \
    openssh-client \
    php7-pecl-xdebug \
    php7-simplexml \
    php7-tokenizer \
    php7-xmlwriter

COPY php.ini /etc/php7/conf.d/20-development.ini
COPY xdebug.ini /etc/php7/conf.d/xdebug.ini

USER nobody:nobody
