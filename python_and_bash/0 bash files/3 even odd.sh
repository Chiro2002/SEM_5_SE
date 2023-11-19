#!/usr/bin/bash

check_number_type() {
    number="$1"
    if (( number % 2 == 0 )); then
        echo "Even"
    else
        echo "Odd"
    fi
}

while true; do
    echo "______________ Menu: _______________"
    echo "1. Check if a number is even or odd"
    echo "2. Exit"

    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter your number: " number
        number_type=$(check_number_type "$number")
        echo "Your number is $number_type"
    elif [ "$choice" -eq 2 ]; then
        echo "Exiting the program."
        break
    else
        echo "Error ! Invalid choice. Please select a valid option."
    fi
done
