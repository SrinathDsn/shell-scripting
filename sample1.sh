#!/bin/bash
# Change this code
BIRTHDATE="Jan 1, 2000"
Presents=10
Birthday= 'date -d "$date1" +%A'

#Testing code - do not change it

if [ "$BIRTHDATE" == "Jan 1, 2000" ] ; then
	echo "BIRTHDATE is correct, it is $BIRTHDATE"
else 
	echo "BIRTHDATE is incorrect - please retry"
fi 
if [ $Presents == 10 ] ; then
	echo "I have received $Presents presents"
else
	echo "Presents is incorrect - please retry"
fi
if [ "$Birthday" == "Saturday" ] ; then
	echo "I was born on $Birthday"
else 
	echo "Birthday is incorrect - please retry"
fi



