# Shell

This repository represents shell scripts for [PHP Library].

# How to run

Clone this repository to the root of PHP Library. Before running certain shell script, check *description* and *requirements*. Some of the scripts are meant to be used only from the root of PHP Library.

# List of available scripts

1. [Auto Test](#auto-test)
1. [PHP Extensions](#php-extensions)
1. [Outsource Install](#outsource-install)

## Auto Test

* File: auto-test.sh
* Arguments: Optional
* Description: Run automatic tests
* Requirements: Composer vendors updated and [outsource folder] downloaded and unzipped

```bash
# Run from root
bash shell/auto-test.sh
```

If you want to test with multiple PHP versions, you may pass optional argument to the script.

```bash
# Run from root for specific PHP version
bash shell/auto-test.sh <php-version>
```

If you're going to switch between multiple versions of PHP, please update `PHP_VERSIONS_ALLOWED` variable with list versions of PHP installed on your OS.

```bash
# Example for running from root for PHP 7.4
bash shell/auto-test.sh 7.4
```

[⬆ back to top](#list-of-available-scripts)

## PHP Extensions

* File: php-extensions.sh
* Arguments: Required
* Description: Install necessary PHP extensions for PHP Library
* Requirements: Installed version of PHP to be passed as an argument

```bash
# Run from root
bash shell/php-extensions.sh <php-version>

# Run directly
bash php-extensions.sh <php-version>
```

You'll have to pass PHP version as an argument.

```bash
# Example for running from root for PHP 7.4
bash shell/php-extensions.sh 7.4
```

[⬆ back to top](#list-of-available-scripts)

## Outsource Install

* File: outsource-install.sh
* Arguments: Optional
* Description: Install outsource folder for PHP Library
* Requirements: Composer installed on OS

```bash
# Run from root
bash shell/outsource-install.sh
```

Optionally you may pass version of outsource repository. Be careful when doing this one!

```bash
# Example for running from root for version 1.1.0
bash shell/php-extensions.sh 1.1.0
```

[⬆ back to top](#list-of-available-scripts)

[outsource folder]: https://github.com/php-library-league/outsource
[PHP Library]: https://github.com/90zlaya/php-library
