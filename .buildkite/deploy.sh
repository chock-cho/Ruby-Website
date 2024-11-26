#!/bin/bash

set -e

echo "Starting deployment..."

ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST << 'EOF'
cd /var/www/rails-app

git pull origin main

bundle install --deployment --without development test
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rails webpacker:compile
RAILS_ENV=production bundle exec puma -C config/puma.rb
EOF

echo "Deployment successfully completed :)"
