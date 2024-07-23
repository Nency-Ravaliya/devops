#!/bin/bash

# Prompt the user to enter the hour in 24-hour format
echo "Enter the hour of the day (in 24-hour format, e.g., 00:00 to 23:59):"
read hour_input

# Function to validate the hour input
validate_hour() {
    if [[ "$1" =~ ^([01][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
        return 0  # Valid input
    else
        return 1  # Invalid input
    fi
}

# Function to categorize the time of day
categorize_time() {
    hour=$(echo $1 | cut -d: -f1)  # Extract the hour part

    if [ $hour -ge 0 ] && [ $hour -lt 6 ]; then
        echo "Early Morning"
    elif [ $hour -ge 6 ] && [ $hour -lt 12 ]; then
        echo "Morning"
    elif [ $hour -ge 12 ] && [ $hour -lt 18 ]; then
        echo "Afternoon"
    elif [ $hour -ge 18 ] && [ $hour -le 23 ]; then
        echo "Late Night"
    else
        echo "Invalid time entered."
    fi
}

# Validate the hour input
if validate_hour "$hour_input"; then
    # Categorize and display the time of day
    time_category=$(categorize_time "$hour_input")
    echo "Time of day: $time_category"
else
    echo "Please enter a valid hour in 24-hour format (e.g., 00:00 to 23:59)."
fi

