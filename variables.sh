#!/bin/bash

a=100
b=devops

echo ${a}times
echo $b

DATE=2022-03-20
echo Today date is $DATE

DATE=$(date +%F)
echo Today date is $DATE

x=10
y=20
ADD=$(($x+$y))
echo Add = $ADD

c=(10 20 small large)
echo First value of array = ${c(0)}
echo Third value of array = ${c(2)}
echo All values of array = ${c(*)}