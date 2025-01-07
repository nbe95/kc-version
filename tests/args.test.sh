#!/bin/bash

# Check argument format (exit codes only)
assert_eq "$($CMD -h            &> /dev/null)$?" "0" "Argument check"
assert_eq "$($CMD --help        &> /dev/null)$?" "0" "Argument check"

assert_eq "$($CMD               &> /dev/null)$?" "1" "Argument check"

assert_eq "$($CMD foo           &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD foo123        &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD foo.bar.123   &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 1.2           &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 12...33       &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 12.34.56.78   &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 12.345.678    &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 1234.56.78    &> /dev/null)$?" "2" "Argument check"
assert_eq "$($CMD 123456789     &> /dev/null)$?" "2" "Argument check"
