FROM  laradock/php-fpm:2.7-7.3

RUN apt-get update \
    && apt-get install -y zip unzip \
    && docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

COPY . /var/www

RUN composer install \
    && cp .env.example .env \
    && php artisan key:generate \
    && chmod -R 777 storage bootstrap/cache