#!/bin/bash

# Exit status is a number, $? is a special variable that holds this value
# $? is going to have the exit status of last executed command.

# Range of exit status is 0-255
# 0 -> Global Success
# 1-255 -> Some failure from the command
# 125+ -> System failures