FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip

# if we don't want to use docker, we can use curl
RUN #curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Latest release - using docker composer image
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
# to install a package
# go to your app in docker docker exec -it name-app sh
# then type composer to check if installation worked
# to insall a package `composer require ramsey/uuid This will also add a composer.json file and lock file in the src folder and a vendor folder as well.
# after we have added autoload to our composer.json, we can run the command to regenerate the files for classes
# `composer dump-autoload -o` // runs in optimized mode with -o flag

WORKDIR /var/www

# Copy your project files into the Docker container
COPY . /var/www

# Initialize Composer with default settings if composer.json does not exist
RUN if [ ! -f composer.json ]; then \
    composer init --no-interaction \
    --name="example/project" \
    --author="Your Name <you@example.com>" \
    --stability="stable" \
    --license="MIT"; \
    fi

# Install dependencies
# RUN composer install --no-dev --optimize-autoloader

# Create a non-root user and switch to it (Optional, based on your Docker setup)
#RUN adduser --disabled-password --gecos '' myuser
#USER myuser

# Check if composer.json exists and install dependencies
#RUN if [ -f /var/www/composer.json ]; then \
#    composer install --no-interaction --no-plugins --no-scripts --no-dev --prefer-dist; \
#    fi
#
# Install dependencies
#RUN composer install \
#    --no-interaction \
#    --no-plugins \
#    --no-scripts \
#    --no-dev \
#    --prefer-dist \
#    -vvv

#RUN composer install

## Install Composer dependencies if composer.json exists
#RUN if [ -f composer.json ]; then composer install --no-interaction --no-plugins --no-scripts --no-dev --prefer-dist; fi


# Debugging step: List files to ensure composer.json is present
RUN ls -la /var/www

# Install Composer dependencies if composer.json exists
RUN if [ -f /var/www/composer.json ]; then composer install --no-interaction --no-plugins --no-scripts --no-dev --prefer-dist -vvv; else echo "composer.json not found"; fi