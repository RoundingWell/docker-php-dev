FROM roundingwell/php-fpm:latest

MAINTAINER devops@roundingwell.com

# Add system packages for development
# https://circleci.com/docs/2.0/custom-images/#required-tools-for-primary-containers
RUN apk --update --no-cache add \
    git \
    openssh-client

# Install composer for self-supporting container
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
COPY install-composer.sh /root/install-composer.sh
RUN /root/install-composer.sh \
    && mv composer.phar /usr/local/bin/composer \
    && rm /root/install-composer.sh

# Add development PHP extensions
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install xdebug-2.7.1 \
    && docker-php-ext-enable xdebug \
    && apk del .build-deps

# Use default development config
# The PHP_INI_DIR variable is defined by the base image.
# https://github.com/php/php-src/blob/master/php.ini-production
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Add additional development settings
COPY xdebug.ini "$PHP_INI_DIR/conf.d/90-xdebug.ini"
