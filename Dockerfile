FROM php:7.0.9-apache

RUN apt-get update -y && \
    apt-get install -y \
    git \
    libgpgme11-dev \
    libicu-dev \
    libmcrypt-dev \
    npm \
    xvfb && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    /usr/bin/npm install -g less && \
    docker-php-ext-install \
        intl \
        mbstring \
        mcrypt \
        pdo \
        pdo_mysql \
        zip \
        && \
    a2enmod rewrite && \
    a2enmod headers && \
    pecl install gnupg && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/sbin --filename=composer
