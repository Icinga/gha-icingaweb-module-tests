#!/bin/bash

set -exo pipefail

clone_composer() {
  DEST="/usr/share/$2"
  git clone "https://github.com/Icinga/${1}.git" "$DEST"

  pushd "$DEST"
  if [ -e composer.json ]; then
    composer install --no-dev --ignore-platform-reqs
  fi
  popd
}

setup_iw2() {
  clone_composer icinga-php-thirdparty icinga-php/vendor
  clone_composer icinga-php-library icinga-php/ipl
  clone_composer icingaweb2 icingaweb2

  ln -vs /usr/share/icingaweb2/bin/icingacli /usr/local/bin/
  icingacli version
}

require_modname() {
  ln -vs "$(dirname "$0")/shortname_extractor" /usr/share/icingaweb2/modules/
  icingacli mod en shortname_extractor

  SHORTNAME="$(icingacli shortname mod shortname)"
  test -n "$SHORTNAME"

  icingacli mod dis shortname_extractor
  rm -v /usr/share/icingaweb2/modules/shortname_extractor
}

test_mod() {
  apt-get install -y php-mockery

  # https://github.com/Icinga/icingaweb2/issues/4928
  cp "$(dirname "$0")/Mockery/Loader.php" /usr/share/php/Mockery/

  cp -r "$PWD" "/usr/share/icingaweb2/modules/$SHORTNAME"

  icingacli mod en "$SHORTNAME"
  icingacli mod en test

  icingacli test php unit --verbose --include 'Tests\\\\Icinga\\\\Modules\\\\'"${SHORTNAME^}"
}

php -v
setup_iw2
require_modname
test_mod
