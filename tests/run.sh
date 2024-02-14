#!/bin/bash

dir="$(dirname "$0")"
VERSION="$dir/../version.sh"
export VERSION

source "$dir/assert/assert.sh"

# Run all unit test files
for file in "$dir"/test*.sh; do
   source "$file"
done
