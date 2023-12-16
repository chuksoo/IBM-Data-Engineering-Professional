#! /bin/bash

# Ask user a binary "yes or no" question
echo "Is November the month for the US elections?"
echo -n "Enter \"y\" for yes, \"n\" for no."

# Store the user's answer in a variable
read response

# Use conditional to print response
if [ "$response" == "y" ]
then
    echo "You are a good student of history. I hope you can vote!"
    echo "Your vote is important. It is your right"
elif [ "$response" == "n" ]
then 
    echo "You don't know your history too well. I hope you know voting takes place in November."
    echo "Please, register to vote and vote right during the November elections"
else 
    echo "Your response must be either 'y' or 'n'."
    echo "Please re-run the script to try again"
fi 
