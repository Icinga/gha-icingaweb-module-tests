#!/bin/bash

set -eo pipefail

case "$1" in
  7.2) echo :8  ;; # https://github.com/sebastianbergmann/phpunit/commit/7c57137323faa15131fc0e70c24fb84f88101609
  7.3) echo :9  ;; # https://github.com/sebastianbergmann/phpunit/commit/8b5b4396716212cadac17162eb4b2bb8586f41ee
  7.4) echo :9  ;; # https://github.com/sebastianbergmann/phpunit/commit/4ef1c3538fd0a8ce908b50cd66cdb68df0efa4c6
  8.0) echo :9  ;; # https://github.com/sebastianbergmann/phpunit/commit/95b61586c5d9b90bcaa516ddca0af00efc408940
  8.1) echo :10 ;; # https://github.com/sebastianbergmann/phpunit/commit/03dd125d61675130c3b5a138703cfd076129d50a
  8.2) echo :11 ;; # https://github.com/sebastianbergmann/phpunit/commit/b2f75a10da52820b3e0fa0e8eabb98f09595904b
esac
