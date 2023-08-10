#!/bin/bash
#
# php8.2 /usr/local/bin/composer config repositories.4 '{"type":"vcs","url":"https://github.com/szepeviktor/TomasBusinessVotruba_class-leak.git"}'
# php8.2 /usr/local/bin/composer require --dev tomasvotruba/class-leak

declare -a IGNORED_TYPES=(
    # Hardcoded in the framework
    'App\Http\Kernel'
    'App\Exceptions\Handler'
)

declare -a SKIP_TYPES

# Laravel event auto discovery
while read -r LISTENER; do
    IGNORED_TYPES+=( "App\\Listeners\\${LISTENER}" )
done < <(find app/Listeners/ -type f -name "*.php" -print0 | xargs -0 -n 1 -- basename --suffix=.php)

# Laravel policy auto discovery
while read -r POLICY; do
    IGNORED_TYPES+=( "App\\Policies\\${POLICY}" )
done < <(find app/Policies/ -type f -name "*.php" -print0 | xargs -0 -n 1 -- basename --suffix=.php)

for TYPE in "${IGNORED_TYPES[@]}"; do
    SKIP_TYPES+=( "--skip-type" "${TYPE}" )
done

php8.2 vendor/bin/class-leak check app/ config/ routes/ "${SKIP_TYPES[@]}"
