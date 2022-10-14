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

php -v
setup_iw2
