#!/bin/bash

# Variable : If we assign a name to set of data that is variable.
# Function : If we assign a name to set of commands that is function.

# func_name() {
# command
# commands
# }

# func_name

## Declare a function
Print_Message() {
  echo Hello,
  echo Good Morning,
  echo Welcome to ${1} Training
  echo "First Argument in Function = $1"
  a=20
  echo "value of a = $a"
  b=20
  }

## Main Program
a=10
Print_Message abc

echo "First Argument in Main Script = $1"
echo "value of b = $b"


## Note, function has always been declared first and then you call function later in the code
# Function weill have its own set of special variables

