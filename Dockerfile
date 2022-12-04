FROM php:7
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo
WORKDIR /app
#COPY /php/laravel/container/Application/. .
#copy all files from github project root dir to image's current folder
COPY . .
RUN composer install

EXPOSE 8080
#CMD php artisan serve --host=0.0.0.0 --port=8080
CMD php artisan serve --port=8080

