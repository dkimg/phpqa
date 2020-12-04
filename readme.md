# PHP

[![Build Status](https://travis-ci.org/dkimg/phpqa.svg?branch=master)](https://travis-ci.org/dkimg/phpqa) ![Docker Pulls](https://img.shields.io/docker/pulls/dkimg/phpqa.svg)

PHP images with basic extensions and QA tools based on [php-cli-alpine](https://hub.docker.com/_/php)

| php | image/tag | size |
|:-----:|:-----:|:-----:|
| `8.0.0` | dkimg/phpqa:8.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/dkimg/phpqa/8.0?label=image) |
| `7.4.13` | dkimg/phpqa:7.4 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/dkimg/phpqa/7.4?label=image) |
| `7.3.25` | dkimg/phpqa:7.3 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/dkimg/phpqa/7.3?label=image) |
| `7.2.34` | dkimg/phpqa:7.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/dkimg/phpqa/7.2?label=image) |

QA tools included:
- [phpdbg](https://www.php.net/manual/en/book.phpdbg.php)
- [pcov](https://github.com/krakjoe/pcov)
- [phpcpd](https://github.com/sebastianbergmann/phpcpd)
- [security-checker](https://github.com/sensiolabs/security-checker)

Loaded extensions:
- gd
- soap
- xml
- simplexml
- tokenizer
- pdo_pgsql
- pdo_mysql
- pgsql
- mysqli
- bcmath
- mbstring
- intl

All images comes with:
- [composer](https://getcomposer.org/)
- memory_limit 256M
