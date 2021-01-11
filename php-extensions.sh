#!/bin/bash

################################################################################
# Script name : php-extensions.sh
# Description : Install necessary PHP extensions for PHP Library
# Arguments   : php-version
# Author      : 90zlaya
# Email       : contact@zlatanstajic.com
# Licence     : MIT
################################################################################

################################################################################
# Globals
################################################################################

SCRIPT_NAME="`basename $(readlink -f $0)`"
SCRIPT_DIR="`dirname $(readlink -f $0)`"
PHP_VERSION=$1

# List of PHP extensions to be installed
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

################################################################################
# Show help
################################################################################

Help()
{
  echo ""
  echo -e "\e[1mRunning $SCRIPT_NAME\e[0m"
  echo "Description: Install necessary PHP extensions for PHP Library"
  echo ""
  echo "Show this help     : $SCRIPT_NAME -h"
  echo "Install extensions : $SCRIPT_NAME <php-version>"
  echo ""
}

################################################################################
# Getting parameters
################################################################################

GetParameters()
{
  if [ $# -eq 1 ]
  then
    if [ "x$1" = "x-h" ]
    then
      Help
      End 0
    fi
  else
    Help
    End 1 "Incorrect parameters"
  fi
}

################################################################################
# Shell terminates
################################################################################

End()
{
  if [ $1 -eq 0 ]
  then
    echo "Script $SCRIPT_NAME finishing OK"
    echo ""
    exit 0
  else
    echo -e "Script $SCRIPT_NAME finishing with \e[1mERROR [$2]\e[0m"
    echo ""
    exit 1
  fi
}

################################################################################
# Executing all
################################################################################

echo ""
echo "Script $SCRIPT_NAME starting..."

GetParameters $@

for extension in ${PHP_EXTENSIONS[*]}
do
  sudo apt-get install php${PHP_VERSION}-${extension}
done

sudo service apache2 restart

End 0

################################################################################
