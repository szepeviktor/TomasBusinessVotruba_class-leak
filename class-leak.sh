#!/bin/bash
#
# php8.2 /usr/local/bin/composer config repositories.4 '{"type":"vcs","url":"https://github.com/szepeviktor/TomasBusinessVotruba_class-leak.git"}'
# php8.2 /usr/local/bin/composer require --dev tomasvotruba/class-leak

# Skipped: Hardcoded in the Laravel Framework
# Skipped: Laravel event auto discovery
# Skipped: Laravel policy auto discovery
php8.2 vendor/bin/class-leak check app config routes \
    --skip-type='App\Http\Kernel' --skip-type='App\Exceptions\Handler' \
    --skip-type='App\Listeners\*' \
    --skip-type='App\Policies\*'
