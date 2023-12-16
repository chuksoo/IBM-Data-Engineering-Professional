#! /bin/bash

# Get integer and read response
echo -n "Give me the first integer: "
read n1
echo -n "Give me the second integer: " 
read n2

sum=$(($n1+$n2))
product=$(($n1*$n2))

echo "The sum of $n1 and $n2 is $sum"
echo "The product of $n1 and $n2 is $product."

# Add logic
if [ $sum -lt $product ]
then
   echo "The sum is less than the product."
elif [[ $sum == $product ]]
then
   echo "The sum is equal to the product."
elif [[ $sum -gt $product ]]
then
    echo "The sum is greater than the product."
fi
