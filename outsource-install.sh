#!/bin/bash

################################################################################
# Script name : outsource-install.sh
# Description : Install outsource folder for PHP Library
# Arguments   : main-version (optional)
# Author      : 90zlaya
# Email       : contact@zlatanstajic.com
# Licence     : MIT
################################################################################

################################################################################
# Globals
################################################################################

SCRIPT_NAME="`basename $(readlink -f $0)`"
SCRIPT_DIR="`dirname $(readlink -f $0)`"
MAIN_VERSION="1.1.0"
FOLDER_NAME="outsource"
ARCHIVE_NAME="archive"

################################################################################
# Show help
################################################################################

Help()
{
  echo ""
  echo -e "\e[1mRunning $SCRIPT_NAME\e[0m"
  echo "Description: Install outsource folder for PHP Library"
  echo ""
  echo "Show this help                   : $SCRIPT_NAME -h"
  echo "Install default outsource folder : $SCRIPT_NAME"
  echo "Install version outsource folder : $SCRIPT_NAME [main-version]"
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
    else
      # Switch main version
      echo -e "Overriding main version to $1"
      MAIN_VERSION=$1
    fi
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

wget "https://github.com/php-library-league/${FOLDER_NAME}/${ARCHIVE_NAME}/${MAIN_VERSION}.zip"
unzip "${MAIN_VERSION}.zip" && rm -rf "${MAIN_VERSION}.zip"
mv "${FOLDER_NAME}-${MAIN_VERSION}/" "${FOLDER_NAME}/"
unzip "${FOLDER_NAME}/${ARCHIVE_NAME}.zip" -d "${FOLDER_NAME}/"
chmod -R 0777 "${FOLDER_NAME}/"

End 0

################################################################################
