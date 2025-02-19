#!/bin/bash
set -e

# Install DDEV
curl -fsSL https://raw.githubusercontent.com/ddev/ddev/master/scripts/install_ddev.sh | bash

# Initialize DDEV project if not already done
if [ ! -d ".ddev" ]; then
    ddev config --project-type=drupal --docroot=web --create-docroot
fi

# Start DDEV
ddev start

# Install Drupal if not already installed
if [ ! -f "web/index.php" ]; then
    ddev composer create "drupal/recommended-project" web
    ddev config --project-type=drupal --docroot=web --create-docroot
    ddev start
fi
