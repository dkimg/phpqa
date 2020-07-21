FROM php:7.3-cli-alpine

RUN set -ex && \
    # packages
    apk add --update --no-cache \
    libpq \
    libzip \
    libxml2 \
    libpng \
    libjpeg-turbo \
    php7-phpdbg && \
    # build deps
    apk add --update --no-cache --virtual \
    .build-deps \
    postgresql-dev \
    libzip-dev \
    libxml2-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    $PHPIZE_DEPS && \
    # php ext
    docker-php-ext-install -j$(nproc) \
    zip \
    gd \
    xml \
    simplexml \
    soap \
    tokenizer \
    pdo \
    pdo_pgsql \
    pdo_mysql \
    pgsql \
    mysqli \
    mbstring \
    bcmath && \
    # pcov
    pecl install pcov && \
    docker-php-ext-enable pcov && \
    # configuring php
    cp ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini && \
    sed -i "/memory_limit = .*/c\memory_limit = 256M" ${PHP_INI_DIR}/php.ini && \
    # phpcpd
    wget https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd && \
    chmod +x /usr/bin/phpcpd && \
    # security checker
    wget https://get.sensiolabs.org/security-checker.phar -O /usr/bin/security-checker && \
    chmod +x /usr/bin/security-checker && \
    # composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    # clean
    apk del --no-cache --no-network .build-deps
