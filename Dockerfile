FROM roundingwell/php-fpm:latest

MAINTAINER devops@roundingwell.com

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

# Add a normal user to execute composer, etc
RUN addgroup -S app && adduser -S -D app -G app

# Execute commands as a normal user
USER app:app
