#!/bin/bash

DIR="$(dirname "$0")"
VERSION="$DIR/../version.sh"

# shellcheck disable=SC1091
source "$DIR/assert/assert.sh"

# Prepare current, next and previous year as variables
CY="$(date +"%y")"
NY=$((CY + 1))
PY=$((CY - 1))


# Invalid argument format (check exit codes only)
assert_eq "$($VERSION               &> /dev/null)$?" "1" "Argument check"
assert_eq "$($VERSION foo           &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION foo123        &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION foo.bar.123   &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 1.2           &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 12...33       &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 12.34.56.78   &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 12.345.678    &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 1234.56.78    &> /dev/null)$?" "2" "Argument check"
assert_eq "$($VERSION 123456789     &> /dev/null)$?" "2" "Argument check"


# Basic dot notation
assert_eq "$($VERSION 0             )" "00.00.0000" "Dot notation parsing"
assert_eq "$($VERSION 1             )" "00.00.0001" "Dot notation parsing"
assert_eq "$($VERSION 00.00.1234    )" "00.00.1234" "Dot notation parsing"
assert_eq "$($VERSION 0.6.9         )" "00.06.0009" "Dot notation parsing"
assert_eq "$($VERSION 00.42.00      )" "00.42.0000" "Dot notation parsing"
assert_eq "$($VERSION 99.00.0       )" "99.00.0000" "Dot notation parsing"
assert_eq "$($VERSION 12.34.5678    )" "12.34.5678" "Dot notation parsing"
assert_eq "$($VERSION 99.99.9999    )" "99.99.9999" "Dot notation parsing"


# Basic integer notation
assert_eq "$($VERSION 0             )" "00.00.0000" "Integer parsing"
assert_eq "$($VERSION 1             )" "00.00.0001" "Integer parsing"
assert_eq "$($VERSION 420000        )" "00.42.0000" "Integer parsing"
assert_eq "$($VERSION 69000000      )" "69.00.0000" "Integer parsing"
assert_eq "$($VERSION 12345678      )" "12.34.5678" "Integer parsing"
assert_eq "$($VERSION 99999999      )" "99.99.9999" "Integer parsing"

assert_eq "$($VERSION -i 0          )"        "0" "Integer output"
assert_eq "$($VERSION -i 1          )"        "1" "Integer output"
assert_eq "$($VERSION -i 00.00.1234 )"     "1234" "Integer output"
assert_eq "$($VERSION -i 00.42.0000 )"   "420000" "Integer output"
assert_eq "$($VERSION -i 69.00.0000 )" "69000000" "Integer output"
assert_eq "$($VERSION -i 12.34.5678 )" "12345678" "Integer output"
assert_eq "$($VERSION -i 99.99.9999 )" "99999999" "Integer output"


# Version bump
assert_eq "$($VERSION --major 12.34.9956    &> /dev/null)$?" "3" "Version limit"
assert_eq "$($VERSION --minor 12.34.5699    &> /dev/null)$?" "3" "Version limit"

assert_eq "$($VERSION --major "00.00.0000"  )" "00.$CY.0100" "Version bump"
assert_eq "$($VERSION --major "42.$PY.1234" )" "42.$CY.0100" "Version bump"
assert_eq "$($VERSION --major "01.$NY.2468" )" "01.$NY.2500" "Version bump"
assert_eq "$($VERSION --minor "69.00.0000"  )" "69.$CY.0100" "Version bump"
assert_eq "$($VERSION --minor "99.$PY.9999" )" "99.$CY.0100" "Version bump"
assert_eq "$($VERSION --minor "01.$NY.2468" )" "01.$NY.2469" "Version bump"

assert_eq "$($VERSION --major "00.$CY.0000" )" "00.$CY.0100" "Version bump"
assert_eq "$($VERSION --major "12.$CY.3456" )" "12.$CY.3500" "Version bump"
assert_eq "$($VERSION --major "78.$CY.9012" )" "78.$CY.9100" "Version bump"
assert_eq "$($VERSION --major "78.$CY.9012" )" "78.$CY.9100" "Version bump"

assert_eq "$($VERSION --minor "00.$CY.0000" )" "00.$CY.0001" "Version bump"
assert_eq "$($VERSION --minor "12.$CY.3456" )" "12.$CY.3457" "Version bump"
assert_eq "$($VERSION --minor "78.$CY.9012" )" "78.$CY.9013" "Version bump"
