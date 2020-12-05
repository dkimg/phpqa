FROM php:7.2-cli-alpine

ENV PATH="$PATH:/root/.composer/vendor/bin"

RUN set -ex \
    && apk add -q --update --no-cache \
        libpq \
        libzip \
        libxml2 \
        libpng \
        libjpeg-turbo \
        php7-phpdbg \
        icu \
    && apk add -q --no-cache --virtual \
        .build-deps \
        postgresql-dev \
        libzip-dev \
        libxml2-dev \
        libpng-dev \
        libjpeg-turbo-dev \
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
        intl \
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
    && composer global require phpunit/phpunit \
    && composer global require squizlabs/php_codesniffer \
    && composer global require phpmd/phpmd \
    && composer global require phpstan/phpstan \
    && composer clearcache \
    && apk del -q --no-cache .build-deps
