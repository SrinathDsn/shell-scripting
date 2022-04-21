#!/bin/bash

echo Hello World

## Color Codes

# Red      31
# Green    32
# yellow   33
# Blue     34
# Magenta  35
# Cyan     36
#

# Synatx : echo -e "\e[COLmHello\e[0m"
# -e option is to enable esc seq, without -e colors will not work
# "" Double Quotes are mandatory for colors to work, otherwise it will not work. Optionally we can use single quotes also but these are preferred ones.
# \e[COLm -> this is to enable the color, COL is one of the color code
# \e[0m -> this is to disable the color

echo -e "\e[32mMy name is Srinath Domala\e[0m"
echo "one more line"

echo -e "Line1\n\nLine2"

echo -e "Word1\t\tWord2"