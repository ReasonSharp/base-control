#!/bin/bash

PACKAGES_DIR=packages
mkdir -p "$PACKAGES_DIR"

write-packages() {
 echo
 echo "available packages:"
 echo "--------------------------------------------------------------------------"
 echo " base <path>               - installs base-env, your home away from \$HOME"
 echo " buttons                   - installs desktop-buttons"
 echo "--------------------------------------------------------------------------"
 echo
}

base-install() {
 if [ -z "${1}" ]; then
  echo "error: requires base directory - your home away from \$HOME"
  exit 1
 fi
 BDIR="${1}"
 if [ -d "${PACKAGES_DIR}/base-env" ]; then
  cd "${PACKAGES_DIR}/base-env" && git pull
  cd - >/dev/null
 else
  git clone git@github.com:ReasonSharp/base-env.git "${PACKAGES_DIR}/base-env"
 fi
 "${PACKAGES_DIR}/base-env/install.sh" "${BDIR}"
}

buttons-install() {
 if [ -d "${PACKAGES_DIR}/desktop-buttons" ]; then
  cd "${PACKAGES_DIR}/desktop-buttons" && git pull
  cd - >/dev/null
 else
  git clone git@github.com:ReasonSharp/desktop-buttons.git "${PACKAGES_DIR}/desktop-buttons"
 fi
 "${PACKAGES_DIR}/desktop-buttons/install.sh"
}
