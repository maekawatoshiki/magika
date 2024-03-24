#!/bin/sh

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/.cache/magika/lib"

exec "${HOME}/.cache/magika/bin/magika" "${HOME}/.cache/magika/models/standard_v1" "${HOME}/.cache/magika/config" "$@"
