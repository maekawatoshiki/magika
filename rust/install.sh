#!/bin/sh -eux

INSTALL_ENTRY="${HOME}/.local/bin/magika"
INSTALL_ROOT="${HOME}/.cache/magika"
INSTALL_BIN="${INSTALL_ROOT}/bin"
INSTALL_LIB="${INSTALL_ROOT}/lib"

cargo b -r --features=bin-dependencies

mkdir -p "${INSTALL_BIN}"
cp ./target/release/magika "${INSTALL_BIN}/magika"

mkdir -p "${INSTALL_LIB}"
cp $(find ./target/release -iname 'libonnxruntime.so.*') "${INSTALL_BIN}/../lib"

mkdir -p $(dirname "${INSTALL_ENTRY}")
cp ./magika.sh "${INSTALL_ENTRY}"
chmod +x "${INSTALL_ENTRY}"

cp -rf ../python/magika/models "${INSTALL_ROOT}/models"
cp -rf ../python/magika/config "${INSTALL_ROOT}/config"

echo "Install complete"
