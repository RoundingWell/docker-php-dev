# PHP-FPM (dev)

Docker image for PHP development.

## Rebuilding

```bash
docker build .
```

Find the latest image SHA with:

```bash
docker images
```

*Note: It should be the latest image.*

Tag it:

```bash
docker tag SHA roundingwell/php-fpm-dev:latest
```

Push it:

```bash
docker push roundingwell/php-fpm-dev:latest
```
