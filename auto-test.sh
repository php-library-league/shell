#!/bin/bash

################################################################################

# Globals
SCRIPT_NAME="`basename $(readlink -f $0)`"
SCRIPT_DIR="`dirname $(readlink -f $0)`"
ROOT_DIR="$SCRIPT_DIR/.."
VENDOR_DIR="$ROOT_DIR/vendor/"

################################################################################

# Print message in certain manner
#
# @param PHP_VERSION
#
function print_message() {
  # Define color
  GREEN="\033[0;32m"
  # Define no-color
  NC="\033[0m"
  # Parameter #1 represents message sting to be printed
  MESSAGE_CONTENT=$1

  echo -e "${GREEN}${MESSAGE_CONTENT}${NC}"
}

################################################################################

# Switch version of PHP
#
# @param PHP_VERSION
#
function php_switch() {
  # Parameter #1 represents PHP version to be set
  PHP_VERSION=$1

  # List versions of PHP installed on your OS
  PHP_VERSIONS_ALLOWED=(
    "7.2"
    "7.3"
    "7.4"
  )

  for version in ${PHP_VERSIONS_ALLOWED[*]}
  do
    sudo a2dismod php${version}
  done

  sudo update-alternatives --set php /usr/bin/php${PHP_VERSION}
  sudo a2enmod php${PHP_VERSION}
  sudo service apache2 restart
  php --version
}

################################################################################

# Switch PHP version if first param is set
if [ -n "$1" ];
then
  print_message "Switching to PHP version ${1}"
  php_switch $1
fi

# Start script
print_message "Started ${SCRIPT_NAME}"

# Run coding standard for src folder
"${VENDOR_DIR}/bin/phpcs" "${ROOT_DIR}/src/" --standard="${ROOT_DIR}/ruleset.xml" --colors
print_message "Finished PHP_CodeSniffer for src folder"

# Run coding standard for tests folder
"${VENDOR_DIR}/bin/phpcs" "${ROOT_DIR}/tests/" --standard="${ROOT_DIR}/ruleset.xml" --colors
print_message "Finished PHP_CodeSniffer for tests folder"

# Run PHP static analysis
"${VENDOR_DIR}/bin/phpstan" analyse "${ROOT_DIR}/src/" --level max
print_message "Finished PHPStan for src folder"

# Run PHPUnit
"${VENDOR_DIR}/bin/phpunit"
print_message "Finished PHPUnit for test folder"

# End script
print_message "Finished ${SCRIPT_NAME}"

################################################################################
