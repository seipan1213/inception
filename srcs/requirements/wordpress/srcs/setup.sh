#!/bin/sh

wp core download --locale=ja

wp config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_USER_PASS} --dbhost=${WP_DB_HOST} --dbprefix=wordpress_

wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_USER_PASS} --admin_email=${WP_ADMIN_USER_EMAIL}

wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass==${WP_USER_PASS}

/usr/sbin/php-fpm7 --nodaemonize