#!/bin/bash

# assign a value to a variable
x=5

# use the if statement to check if the value of x is greater than 3
if [ $x -gt 3 ]; then
  echo "x is greater than 3"
elif [ $x -eq 3 ]; then
  echo "x is equal to 3"
else
  echo "x is less than 3"
fi
