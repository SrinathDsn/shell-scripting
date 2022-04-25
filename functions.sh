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
  }

Print_Message DevOps

## Note, function has always been declared first and then you call function later in the code

