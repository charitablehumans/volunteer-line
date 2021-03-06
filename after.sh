#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# When a user connects via SSH, start in the project directory.
grep -Fq "cd ~/code" ~/.bashrc || echo "\n# Start in the code/ directory\ncd ~/code" >> ~/.bashrc
cd ~/code

# Install npm dependencies and build site scripts/styles.
npm install --no-progress
npm run development -- --no-progress

# Run database migrations.
php artisan migrate
