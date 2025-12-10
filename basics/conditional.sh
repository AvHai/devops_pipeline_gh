#!/bin/bash



<<disclaimer
now this looks good
disclaimer

read -p "Some random text for user to see " variable1

read -p "number give "  var2


if [[ $variable1 == "text" ]]
then
	echo "Some print for if true statement"
elif [[  $var2 -ge 20 ]]
then
	echo " not if but elif"
else
	echo " Else statement"
fi



