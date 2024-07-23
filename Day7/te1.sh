#!/bin/bash

echo "Enter the time in hh:mm format:"
read time_input

# Validate input format
if ! [[ $time_input =~ ^([0-1][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
    echo "Please enter the time in correct hh:mm format (00:00 to 23:59)"
    exit 1
fi

# Extract hours from input
hours=$(echo $time_input | cut -d':' -f1)

# Determine time of the day
if (( hours >= 0 && hours < 6 )); then
    echo "Early Morning"
elif (( hours >= 6 && hours < 12 )); then
    echo "Morning"
elif (( hours >= 12 && hours < 18 )); then
    echo "Afternoon"
else
    echo "Night"
fi
