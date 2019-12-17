# Shell

This repository represents shell scripts for [PHP Library].

# How to run

Clone this repository to the root of PHP Library. Before running certain shell script, check *description* and *requirements*. Some of the scripts are meant to be used only from root of PHP Library.

# List of available scripts

1. [Auto Test]
2. [PHP Extensions]

## Auto Test

* File: auto-test.sh
* Description: Run automatic tests
* Requirements: Composer vendors updated and [outsource folder] downloaded and unzipped

```bash
# Run from root
bash shell/auto-test.sh
```

## PHP Extensions

* File: php-extensions.sh
* Description: Install necessary PHP extensions for PHP Library
* Requirements: Installed version of PHP to be passed as an argument

```bash
# Run from root
bash shell/php-extensions.sh <php-version>

# Run directly
bash php-extensions.sh <php-version>

# Example for running from root for PHP 7.4
bash shell/php-extensions.sh 7.4
```

You'll have to pass PHP version as an argument.

[Auto Test]: README.md#auto-test
[PHP Extensions]: README.md#php-extensions
[outsource folder]: https://github.com/php-library-league/outsource
[PHP Library]: https://github.com/90zlaya/php-library
