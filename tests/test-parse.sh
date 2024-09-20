#!/bin/bash

# Check dot-style parsing and output
assert_eq "$($VERSION 0             )" "00.00.0000" "Dot notation parsing"
assert_eq "$($VERSION 1             )" "00.00.0001" "Dot notation parsing"
assert_eq "$($VERSION 00.00.1234    )" "00.00.1234" "Dot notation parsing"
assert_eq "$($VERSION 0.6.9         )" "00.06.0009" "Dot notation parsing"
assert_eq "$($VERSION 00.42.00      )" "00.42.0000" "Dot notation parsing"
assert_eq "$($VERSION 99.00.0       )" "99.00.0000" "Dot notation parsing"
assert_eq "$($VERSION 12.34.5678    )" "12.34.5678" "Dot notation parsing"
assert_eq "$($VERSION 99.99.9999    )" "99.99.9999" "Dot notation parsing"

assert_eq "$($VERSION v0            )" "00.00.0000" "Dot notation parsing"
assert_eq "$($VERSION v1            )" "00.00.0001" "Dot notation parsing"
assert_eq "$($VERSION v00.00.1234   )" "00.00.1234" "Dot notation parsing"
assert_eq "$($VERSION v0.6.9        )" "00.06.0009" "Dot notation parsing"
assert_eq "$($VERSION v00.42.00     )" "00.42.0000" "Dot notation parsing"
assert_eq "$($VERSION v99.00.0      )" "99.00.0000" "Dot notation parsing"
assert_eq "$($VERSION v12.34.5678   )" "12.34.5678" "Dot notation parsing"
assert_eq "$($VERSION v99.99.9999   )" "99.99.9999" "Dot notation parsing"



# Check integer parsing and output
assert_eq "$($VERSION 0             )" "00.00.0000" "Integer parsing"
assert_eq "$($VERSION 1             )" "00.00.0001" "Integer parsing"
assert_eq "$($VERSION 420000        )" "00.42.0000" "Integer parsing"
assert_eq "$($VERSION 69000000      )" "69.00.0000" "Integer parsing"
assert_eq "$($VERSION 12345678      )" "12.34.5678" "Integer parsing"
assert_eq "$($VERSION 99999999      )" "99.99.9999" "Integer parsing"

assert_eq "$($VERSION v0            )" "00.00.0000" "Integer parsing"
assert_eq "$($VERSION v1            )" "00.00.0001" "Integer parsing"
assert_eq "$($VERSION v420000       )" "00.42.0000" "Integer parsing"
assert_eq "$($VERSION v69000000     )" "69.00.0000" "Integer parsing"
assert_eq "$($VERSION v12345678     )" "12.34.5678" "Integer parsing"
assert_eq "$($VERSION v99999999     )" "99.99.9999" "Integer parsing"

assert_eq "$($VERSION -i 0          )"        "0" "Integer output"
assert_eq "$($VERSION -i 1          )"        "1" "Integer output"
assert_eq "$($VERSION -i 00.00.1234 )"     "1234" "Integer output"
assert_eq "$($VERSION -i 00.42.0000 )"   "420000" "Integer output"
assert_eq "$($VERSION -i 69.00.0000 )" "69000000" "Integer output"
assert_eq "$($VERSION -i 12.34.5678 )" "12345678" "Integer output"
assert_eq "$($VERSION -i 99.99.9999 )" "99999999" "Integer output"
