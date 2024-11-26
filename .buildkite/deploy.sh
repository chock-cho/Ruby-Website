#!/bin/bash

set -e

echo "Starting deployment..."

ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST << 'EOF'
cd /var/www/rails-app

git pull origin main

bundle install --deployment --without development test

RAILS_ENV=production rails db:migrate #db migration

RAILS_ENV=production rails assets:precompile

sudo systemctl restart puma
EOF

echo "Deployment successfully completed :)"
