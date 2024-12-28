#!/bin/bash

set -x

dir="$(dirname "$0")"
CMD="$dir/../version.sh"

export CMD

source "$dir/util/assert/assert.sh"

# Run all unit test files
set -e
for file in "$dir"/*.test.sh; do
   source "$file"
done
