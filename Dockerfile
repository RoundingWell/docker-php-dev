MAINTAINER woody.gilk@roundingwell.com

FROM php:7.3-fpm

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY conf/php.ini "$PHP_INI_DIR/conf.d/php.ini"
COPY conf/xdebug.ini "$PHP_INI_DIR/conf.d/xdebug.ini"

RUN apt-get update && apt-get install -y \
        libcurl4-openssl-dev \
        libicu-dev \
        libpq-dev \
        zlib1g-dev \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pgsql \
    && docker-php-ext-install -j$(nproc) pdo_pgsql
