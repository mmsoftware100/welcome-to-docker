# Use an official PHP runtime as a parent image
FROM php:8.0-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy composer.lock and composer.json into the container
COPY ./laravel/composer.lock ./laravel/composer.json /var/www/html/

# Install any needed packages specified in composer.lock
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite

# Copy the current directory contents into the container at /var/www/html
COPY ./laravel /var/www/html

# Install Laravel dependencies
RUN composer install --no-interaction --optimize-autoloader

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage
RUN chown -R www-data:www-data /var/www/html/bootstrap/cache


# Optionally, you can customize the Apache configuration
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

# Run Apache
CMD ["apache2-foreground"]

