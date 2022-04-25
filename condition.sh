#!/bin/bash

# case and if are conditional commands, if command is widely because it has more options than case command.

# If condition.
# If found in three forms.

# Simple If
#if [ expression [
# then
# commands
 # fi

# shellcheck disable=SC1073

# Expressions are important
# 1. String Tests
# Operators : ==, !=, -z
# 2. Number Tests
# Operators: -eq, -ne, -le, -lt, -gt, -ge
# 3. File Tests
# Operators
# -e -> to check file exists or not
# https://tldp.org/LDP/abs/html/fto.html

a="abc"
if [ "$a" == "abc" ]; then
  echo Both are equal
fi

if [ "$a" != "abc" ]; then
  echo "Both are not equal"
fi

if [ -z "$b" ];then
  echo b variable is empty
fi

## One observation, I am using quotes for variables. And it is a best practice.

