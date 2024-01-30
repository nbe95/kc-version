#!/bin/bash

# Check argument format (exit codes only)
assert_eq "$($VERSION -h            &> /dev/null)$?" "0" "Argument check"
assert_eq "$($VERSION --help        &> /dev/null)$?" "0" "Argument check"

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
