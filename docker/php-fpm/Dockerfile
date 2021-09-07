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
RUN wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony/bin/symfony /usr/local/bin/symfony \
    && mkdir /var/www/.symfony \
    && chown www-data:www-data /var/www/.symfony

RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer-2.phar
RUN chmod 0755 /usr/local/bin/composer
#RUN composer global require hirak/prestissimo

#ADD ./install_scripts/install_privilege.sh /install.sh
#RUN chmod 700 /install.sh && sh /install.sh && rm -rf /install.sh

#RUN chown -R www-data:www-data /var/www/
ENV XDEBUG_MODE=coverage

COPY ./docker/php-fpm/scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
