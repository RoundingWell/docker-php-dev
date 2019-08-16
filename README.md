# RoundingWell PHP-FPM (dev)

Extends [roundingwell/php-fpm](https://hub.docker.com/r/roundingwell/php-fpm)
with development tools.

<https://hub.docker.com/r/roundingwell/php-fpm-dev>

## Remote XDebug

Remote XDebug is disabled by default due to an issue with Docker 19 and exposing the port.

You can manually enable it by editing the `$PHP_INI_DIR/conf.d/90-xdebug.ini` file inside the container, then exposing the necessary port.
