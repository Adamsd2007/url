# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install common PHP extensions (used by most URL shortener scripts)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache Rewrite for short URL routing
RUN a2enmod rewrite

# Copy your app files to the web root
COPY . /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80
