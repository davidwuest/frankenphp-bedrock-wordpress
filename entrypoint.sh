#!/bin/sh
set -e

# Install Composer dependencies if not already installed
if [ ! -d "web/wp" ]; then
  echo "Installing Composer dependencies..."
  composer update --no-dev --optimize-autoloader
  composer install --no-dev --optimize-autoloader
fi

exec "$@"