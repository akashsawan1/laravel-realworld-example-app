#!/bin/bash
set -e

echo "🎯 Starting Laravel setup..."

if [ ! -d "vendor" ]; then
    echo "📦 Installing Composer dependencies..."
    composer install
fi


if [ ! -f ".env" ]; then
    echo "📝 Copying .env.example to .env"
    cp .env.example .env
fi


if ! grep -q "APP_KEY=base64" .env; then
    echo "🔐 Generating app key..."
    php artisan key:generate
fi


echo "🚀 Serving Laravel at http://localhost:8000"
exec php artisan serve --host=0.0.0.0 --port=8000
