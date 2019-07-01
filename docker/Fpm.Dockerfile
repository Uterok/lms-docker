FROM php:7.3.6-fpm

RUN apt-get update && apt-get install -y \
supervisor libpq-dev \
&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
&& docker-php-ext-install pdo pdo_mysql pdo_pgsql