#!/bin/bash

################################################################################
# Script name : php-extensions.sh
# Description : Install PHP extensions
# Arguments   : PHP_VERSION
# Author      : 90zlaya
# Email       : contact@zlatanstajic.com
# Licence     : MIT
################################################################################

# Parameter #1 represents PHP version to be set
PHP_VERSION=$1

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
)

for extension in ${PHP_EXTENSIONS[*]}
do
  sudo apt-get install php${PHP_VERSION}-${extension}
done

sudo service apache2 restart
