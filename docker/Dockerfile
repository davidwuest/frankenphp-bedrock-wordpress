FROM dunglas/frankenphp:latest

# install the PHP extensions we need
RUN install-php-extensions \
    bcmath \
    exif \
    gd \
    intl \
    mysqli \
    zip \
    imagick \
    opcache

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./docker/caddy/Caddyfile /etc/caddy/Caddyfile
COPY --chown=root:root ./ /app/

# Copy the entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install PHP dependencies (WordPress via Bedrock)
WORKDIR /app
# RUN composer install --no-dev --optimize-autoloader

ENTRYPOINT ["/entrypoint.sh"]
CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]

