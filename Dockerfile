FROM roundingwell/php-fpm:latest

MAINTAINER woody.gilk@roundingwell.com

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY conf/xdebug.ini "$PHP_INI_DIR/conf.d/xdebug.ini"

RUN pecl install xdebug && docker-php-ext-enable xdebug
