# Use the official Ubuntu PHP base image
FROM php:7.4-apache

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libz-dev \
    libmemcached-dev \
    memcached \
    netcat \
    imagemagick \
    && docker-php-ext-install zip \
    && pecl install memcached \
    && docker-php-ext-enable memcached

# Copy the Memcached configuration file
RUN echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/memory-limit.ini
COPY memcached.conf /etc/memcached.conf

RUN a2enmod rewrite

# Copy the PHP application code to the container
COPY src/ /var/www/html

# Expose the default Memcached and web server ports
EXPOSE 11211 80

# Copy the smoke tests script
COPY smoke_tests.sh /usr/local/bin/smoke_tests.sh

# Make the start and smoke tests scripts executable
RUN chmod +x /usr/local/bin/smoke_tests.sh

# Run smoke tests during the build
RUN /usr/local/bin/smoke_tests.sh

# Start Memcached and Apache
CMD service memcached start && apache2-foreground