# Shell

This repo represents [PHP Library](https://github.com/90zlaya/php-library) shell scripts.

## How to Run

Clone this repository to the root of PHP Library. Before running certain shell script, check *description* and *requirements*. Some of the scripts are meant to be used only from the root of PHP Library.

## List of Available Scripts

* [Auto Test](#auto-test)
* [PHP Extensions](#php-extensions)
* [Outsource Install](#outsource-install)

### Auto Test

* File: auto-test.sh
* Arguments: php-version (optional)
* Description: Run automatic tests
* Requirements: Composer vendors updated and [outsource repository](https://github.com/php-library-league/outsource) downloaded and unzipped

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

### PHP Extensions

* File: php-extensions.sh
* Arguments: php-version
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

### Outsource Install

* File: outsource-install.sh
* Arguments: main-version (optional)
* Description: Install outsource folder for PHP Library
* Requirements: Composer installed on machine

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
