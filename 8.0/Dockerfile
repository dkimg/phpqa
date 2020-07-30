FROM php:8.0.0alpha3-alpine

RUN set -ex \
    && apk add -q --update --no-cache \
        libpq \
        libzip \
        libxml2 \
        libpng \
        libjpeg-turbo \
        php7-phpdbg \
    && apk add -q --no-cache --virtual \
        .build-deps \
        postgresql-dev \
        libzip-dev \
        libxml2-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        oniguruma-dev \
        $PHPIZE_DEPS \
    && docker-php-ext-install -j$(nproc) \
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
        bcmath \
        > /dev/null \
    && pecl -q install pcov \
    && docker-php-ext-enable pcov \
    && cp ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini \
    && sed -i "/memory_limit = .*/c\memory_limit = 256M" ${PHP_INI_DIR}/php.ini \
    && wget -q https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd \
    && chmod +x /usr/bin/phpcpd \
    && wget -q https://get.sensiolabs.org/security-checker.phar -O /usr/bin/security-checker \
    && chmod +x /usr/bin/security-checker \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apk del -q --no-cache .build-deps
