# Use the official PHP image
FROM php:8.0-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html


# Expose port 5508
# 5508 က အလုပ်မဖြစ်။
EXPOSE 80
