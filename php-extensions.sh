#!/bin/bash

# List of PHP extensions
PHP_EXTENSIONS=(
  "mbstring"
  "xml"
  "zip"
  "curl"
  "pdo"
  "mysql"
  "sqlite3"
  "gd"
);

# Parameter #1 represents PHP version to be set
PHP_VERSION=$1;

for extension in ${PHP_EXTENSIONS[*]}
do
  sudo apt-get install php${PHP_VERSION}-${extension};
done
