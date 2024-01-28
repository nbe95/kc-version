#!/bin/bash

DIR="$(dirname "$0")"
VERSION="$DIR/../version.sh"

# shellcheck disable=SC1091
source "$DIR/assert/assert.sh"


# Invalid argument format (check exit codes only)
assert_eq "$($VERSION               &> /dev/null)$?" "1" "invalid"
assert_eq "$($VERSION foo           &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION foo123        &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION foo.bar.123   &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 1.2           &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 12...33       &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 12.34.56.78   &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 12.345.678    &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 1234.56.78    &> /dev/null)$?" "2" "invalid"
assert_eq "$($VERSION 123456789     &> /dev/null)$?" "2" "invalid"


# Basic dot notation
assert_eq "$($VERSION 0             )" "00.00.0000" "invalid"
assert_eq "$($VERSION 1             )" "00.00.0001" "invalid"
assert_eq "$($VERSION 00.00.1234    )" "00.00.1234" "invalid"
assert_eq "$($VERSION 0.6.9         )" "00.06.0009" "invalid"
assert_eq "$($VERSION 00.42.00      )" "00.42.0000" "invalid"-
assert_eq "$($VERSION 420000        )" "00.42.0000" "invalid"
assert_eq "$($VERSION 69000000      )" "69.00.0000" "invalid"
assert_eq "$($VERSION 12345678      )" "12.34.5678" "invalid"
assert_eq "$($VERSION 99999999      )" "99.99.9999" "invalid"

assert_eq "$($VERSION -i 0          )" "00000000" "invalid"
assert_eq "$($VERSION -i 1          )" "00000001" "invalid"
assert_eq "$($VERSION -i 00.00.1234 )" "00001234" "invalid"
assert_eq "$($VERSION -i 00.42.0000 )" "00420000" "invalid"
assert_eq "$($VERSION -i 69.00.0000 )" "69000000" "invalid"
assert_eq "$($VERSION -i 12.34.5678 )" "12345678" "invalid"
assert_eq "$($VERSION -i 99.99.9999 )" "99999999" "invalid"


# Prepare current, next and previous year as variables
CY="$(date +"%y")"
NY=$((CY + 1))
PY=$((CY - 1))

# Version bump-
assert_eq "$($VERSION --major "00.$CY.0000" )" "00.$CY.0100" "invalid"
assert_eq "$($VERSION --major "12.$CY.3456" )" "12.$CY.3500" "invalid"
assert_eq "$($VERSION --major "78.$CY.9012" )" "78.$CY.9100" "invalid"
assert_eq "$($VERSION --major "78.$CY.9012" )" "78.$CY.9100" "invalid"

assert_eq "$($VERSION --minor "00.$CY.0000" )" "00.$CY.0001" "invalid"
assert_eq "$($VERSION --minor "12.$CY.3456" )" "12.$CY.3457" "invalid"
assert_eq "$($VERSION --minor "78.$CY.9012" )" "78.$CY.9013" "invalid"
