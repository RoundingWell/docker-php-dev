# RoundingWell PHP-FPM (dev)

Docker container for PHP-FPM (development only).

<https://hub.docker.com/r/roundingwell/php-fpm-dev>

## Build and Test

```bash
docker build .
docker run --rm -v $(pwd):/var/www/html $(docker images -q | head -1)
```
