#!/usr/bin/bash

find_largest() {
    num1="$1"
    num2="$2"
    num3="$3"

    if (( num1 >= num2 && num1 >= num3 )); then
        echo "$num1"
    elif (( num2 >= num1 && num2 >= num3 )); then
        echo "$num2"
    else
        echo "$num3"
    fi
}

echo "Select an option:"
echo "1. Find the largest of three numbers"
echo "2. Exit"

while true; do
    read -p "Enter choice (1/2): " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the first number: " num1
        read -p "Enter the second number: " num2
        read -p "Enter the third number: " num3

        largest=$(find_largest "$num1" "$num2" "$num3")
        echo "The largest number is: $largest"
    elif [ "$choice" -eq 2 ]; then
        echo "Exiting the program."
        break
    else
        echo "Error ! Invalid choice. Please select 1 or 2."
    fi
done
