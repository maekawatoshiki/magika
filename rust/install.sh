#!/bin/sh -eux

INSTALL_ENTRY="${HOME}/.local/bin/magika"
INSTALL_ROOT="${HOME}/.cache/magika"
INSTALL_BIN="${INSTALL_ROOT}/bin"

cargo b -r --features=bin

mkdir -p "${INSTALL_BIN}"
cp ./target/release/magika "${INSTALL_BIN}/magika"

mkdir -p $(dirname "${INSTALL_ENTRY}")
cp ./magika.sh "${INSTALL_ENTRY}"
chmod +x "${INSTALL_ENTRY}"

cp -rf ../python/magika/models "${INSTALL_ROOT}/models"
cp -rf ../python/magika/config "${INSTALL_ROOT}/config"

echo "Install complete"
