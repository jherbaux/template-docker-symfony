ARG COMPOSER_VERSION
ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm

RUN apt-get update \
    && groupadd -r dev \
    && useradd -r -g dev -d /var/www/html -s /sbin/nologin dev \
    && apt-get install -y --no-install-recommends \
        apt-transport-https=* \
        wget=* git=* zip=* unzip=* \
        acl=* \
        libicu-dev=* \
        libfreetype6-dev=* \
        libjpeg62-turbo-dev=* \
        libmcrypt-dev=* \
        zlib1g-dev=* \
        libxml2-dev=* \
        libbz2-dev=* \
        libzip-dev=* \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install -o -f apcu xdebug-beta \
    && docker-php-ext-configure \
        gd \
    && docker-php-ext-install \
        intl \
        mysqli \
        pdo_mysql \
        zip \
        soap \
        bz2 \
        gd \
    && docker-php-ext-enable \
        apcu \
        xdebug \
        gd \
    && rm -rf /tmp/pear

COPY ./docker/php-fpm/config/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php-fpm/config/xdebug.ini ./docker/php-fpm/config/apcu.ini /usr/local/etc/php/conf.d/

SHELL ["/bin/bash", "-o", "pipefail", "-c"]


RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt update
RUN apt install symfony-cli

RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer-2.phar
RUN chmod 0755 /usr/local/bin/composer

ENV XDEBUG_MODE=coverage

COPY ./docker/php-fpm/scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
