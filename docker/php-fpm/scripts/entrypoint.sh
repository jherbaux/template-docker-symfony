#!/usr/bin/env bash

#PUID=$(stat -c "%u" /var/www/html)
#PGID=$(stat -c "%g" /var/www/html)

echo "symfony  install"

echo  '--Q-'${USER_ID}
echo  ${GROUP_ID}

usermod -u "${USER_ID}" www-data
groupmod -g "${GROUP_ID}" www-data

chown -R www-data:www-data /var/www/
chown -R www-data:www-data /var/www/.gitconfig/

chown -R www-data:www-data /var/www/html/bin
chown -R www-data:www-data /var/www/html/var
chown -R www-data:www-data /var/www/html/vendor
chown -R www-data:www-data /var/www/html

# Disable XDebug
#if [ ! "${XDEBUG_ENABLED}" = 1 ]; then
#    rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
#fi

# Disable Blackfire
#if [ ! "${BLACKFIRE_ENABLED}" = 1 ]; then
#    rm -f /usr/local/etc/php/conf.d/blackfire.ini
#fi

# Start PHP-FPM
if [ "$IS_ROOT" = "0" ]; then
    php-fpm
else
    sed -i -e "s/user.*/user = www-data/" /usr/local/etc/php-fpm.d/www.conf
    sed -i -e "s/group.*/group = www-data/" /usr/local/etc/php-fpm.d/www.conf
    php-fpm -R
fi
