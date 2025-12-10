#!/bin/bash



# types of loops 



for (( i= 1; i<=5; i++  ))
do
	echo "print $i "
done


#while


num=0

while [[ $num -le 5 ]] 
do
	echo " num $num"
	((num = $num+2))
done


