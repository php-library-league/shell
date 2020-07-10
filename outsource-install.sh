#!/bin/bash

################################################################################
# Script name : outsource-install.sh
# Description : Install necessary PHP extensions for PHP Library
# Arguments   : MAIN_VERSION (optional)
# Author      : 90zlaya
# Email       : contact@zlatanstajic.com
# Licence     : MIT
################################################################################

################################################################################

# Globals
MAIN_VERSION="1.1.0"
FOLDER_NAME="outsource"
ARCHIVE_NAME="archive"

################################################################################

# Switch main version if first param is set
if [ -n "$1" ]
then
  echo -e "Overriding main version to $1"
  MAIN_VERSION=$1
fi

# Download outsource repository
wget "https://github.com/php-library-league/${FOLDER_NAME}/${ARCHIVE_NAME}/${MAIN_VERSION}.zip"

# Unzip and remove downloaded file
unzip "${MAIN_VERSION}.zip" && rm -rf "${MAIN_VERSION}.zip"

# Rename folder
mv "${FOLDER_NAME}-${MAIN_VERSION}/" "${FOLDER_NAME}/"

# Unzip archive
unzip "${FOLDER_NAME}/${ARCHIVE_NAME}.zip" -d "${FOLDER_NAME}/"

# Give full permissions to all outsource folders and files
chmod -R 0777 "${FOLDER_NAME}/"

# Update Composer vendors folder
composer update

# Run PHPUnit tests
composer run phpunit
