# Shell

This repo represents [PHP Library](https://github.com/90zlaya/php-library) shell scripts.

## How to Run

Clone this repository to the root of PHP Library. Before running certain shell script, consult documentation. 

## List of Available Scripts

* [Auto Test](#auto-test)
* [PHP Extensions](#php-extensions)
* [Outsource Install](#outsource-install)

### Auto Test

* File: [auto-test.sh](auto-test.sh)
* Arguments: None
* Description: Run automatic tests
* Requirements: Composer vendors updated and [outsource folder](https://github.com/php-library-league/outsource) downloaded and unzipped

```bash
# Get help
bash shell/auto-test.sh -h

# Run script
bash shell/auto-test.sh
```

[⬆ back to top](#list-of-available-scripts)

### PHP Extensions

* File: [php-extensions.sh](php-extensions.sh)
* Arguments: php-version
* Description: Install necessary PHP extensions for PHP Library
* Requirements: Installed version of PHP to be passed as an argument

```bash
# Get help
bash shell/php-extensions.sh -h

# Run script
bash shell/php-extensions.sh [php-version]
```

You'll have to pass PHP version as an argument.

```bash
# Example how to runn script for PHP 7.4
bash shell/php-extensions.sh 7.4
```

[⬆ back to top](#list-of-available-scripts)

### Outsource Install

* File: [outsource-install.sh](outsource-install.sh)
* Arguments: main-version (optional)
* Description: Install outsource folder for PHP Library
* Requirements: Composer installed on machine

```bash
# Get help
bash shell/outsource-install.sh -h

# Run script
bash shell/outsource-install.sh
```

Optionally you may pass version of outsource folder.

```bash
# Example how to runn script for version 1.1.0
bash shell/outsource-install.sh 1.1.0
```

[⬆ back to top](#list-of-available-scripts)
