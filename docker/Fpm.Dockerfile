FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
supervisor \
&& docker-php-ext-install pdo pdo_mysql