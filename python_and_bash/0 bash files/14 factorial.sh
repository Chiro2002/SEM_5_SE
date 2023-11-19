#!/usr/bin/bash

calculate_factorial() {
    num="$1"
    if (( num < 0 )); then
        echo "Factorial is not defined for negative numbers"
    else
        result=$(echo "1" ; for ((i=1; i<=num; i++)); do echo "$i"; done | paste -sd* | bc)
        echo "$result"
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Calculate Factorial"
    echo "2. Exit"

    read -p "Enter your choice (1/2): " choice

    if [ "$choice" = "1" ]; then
        read -p "Enter a non-negative integer: " num
        if [[ "$num" =~ ^[0-9]+$ ]]; then
            echo "The factorial of $num is $(calculate_factorial $num)"
        else
            echo "Invalid input. Please enter a non-negative integer."
        fi
    elif [ "$choice" = "2" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1 or 2."
    fi
done
