#!/bin/bash

# Download outsource repository
wget https://github.com/php-library-league/outsource/archive/1.1.0.zip

# Unzip and remove downloaded file
unzip 1.1.0.zip && rm -rf 1.1.0.zip

# Rename folder
mv outsource-1.1.0/ outsource/

# Unzip archive
unzip outsource/archive.zip -d outsource/

# Give full permissions to all outsource folders and files
chmod -R 0777 outsource/

# Update Composer vendors folder
composer update

# Run PHPUnit tests
composer run phpunit
