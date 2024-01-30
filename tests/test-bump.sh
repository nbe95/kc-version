#!/bin/bash

# Check exceeding of version limits
assert_eq "$($VERSION --major 12.34.9956    &> /dev/null)$?" "3" "Version limit"
assert_eq "$($VERSION --minor 12.34.5699    &> /dev/null)$?" "3" "Version limit"


# Check major/minor version bump
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
