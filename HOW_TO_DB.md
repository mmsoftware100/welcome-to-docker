Certainly! To set up a Dockerized MySQL (MariaDB) server and Laravel application, you can follow the steps below. Make sure you have Docker and Docker Compose installed on your machine.

1. **Create a Laravel Project:**
   If you don't have a Laravel project yet, you can create one using the following command:

   ```bash
   composer create-project --prefer-dist laravel/laravel my-laravel-app
   ```

   This command will create a new Laravel project in a folder named `my-laravel-app`.

2. **Create Docker Compose File:**
   Create a `docker-compose.yml` file in the root of your Laravel project with the following content:

   ```yaml
   version: '3.1'

   services:
     # MySQL (MariaDB) Service
     db:
       image: mariadb
       environment:
         MYSQL_ROOT_PASSWORD: root_password
         MYSQL_DATABASE: laravel_db
         MYSQL_USER: laravel_user
         MYSQL_PASSWORD: laravel_password
       ports:
         - "3306:3306"
       volumes:
         - db_data:/var/lib/mysql

     # Laravel Service
     app:
       build:
         context: .
         dockerfile: Dockerfile
       image: laravel-app
       restart: unless-stopped
       working_dir: /var/www
       command: "php artisan serve --host=0.0.0.0"
       environment:
         DB_CONNECTION: mysql
         DB_HOST: db
         DB_PORT: 3306
         DB_DATABASE: laravel_db
         DB_USERNAME: laravel_user
         DB_PASSWORD: laravel_password
       ports:
         - "8000:8000"
       depends_on:
         - db

   volumes:
     db_data:

   ```

3. **Create a Dockerfile for Laravel:**
   Create a `Dockerfile` in the root of your Laravel project with the following content:

   ```Dockerfile
   FROM php:7.4-fpm

   WORKDIR /var/www

   COPY . /var/www

   RUN apt-get update && \
       apt-get install -y libzip-dev unzip && \
       docker-php-ext-install zip pdo pdo_mysql && \
       curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

   RUN composer install

   RUN php artisan key:generate

   EXPOSE 8000

   CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
   ```

4. **Build and Run Docker Containers:**
   Open a terminal, navigate to the Laravel project root, and run the following command:

   ```bash
   docker-compose up --build
   ```

   This command will build the Docker images and start the containers.

5. **Access Laravel Application:**
   Once the containers are running, you can access your Laravel application at `http://localhost:8000`.

Now, you have a Dockerized MySQL (MariaDB) server and a Laravel application running in separate containers. The Laravel application is configured to use the MySQL container as its database server.

Keep in mind that this setup is for development purposes. In a production environment, you may need additional configurations and security measures.