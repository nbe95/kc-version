#!/bin/bash

DIR="$(dirname "$0")"
VERSION="$DIR/../version.sh"
export VERSION

# shellcheck disable=SC1091
source "$DIR/assert/assert.sh"

# Prepare current, next and previous year as variables
CY="$(date +"%y")"
NY=$((CY + 1))
PY=$((CY - 1))
export CY
export NY
export PY

# Run separate unit tests
"$DIR/test-git.sh"
"$DIR/test-args.sh"
"$DIR/test-parse.sh"
"$DIR/test-bump.sh"
