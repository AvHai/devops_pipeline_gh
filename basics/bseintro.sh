#!/bin/bash

# One line comment 

: <<'END_COMMENT'
This is a multi-line comment.
It can span across
multiple lines
without needing a '#' at the beginning of each line.
END_COMMENT

echo "This line will be executed."

name= "Hariable"

echo "Name is $name and date is $(date)"

echo "enter username"

# this is how we take input from user via read command
read username

echo "You entered $username"

# To access and give arguments we add it while running the exe.

# We access it using $0 and $1 ..likewise

echo " Print the following arguments : 0th $0 and $1 and $2"


