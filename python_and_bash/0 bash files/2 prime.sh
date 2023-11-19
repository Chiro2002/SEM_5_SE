#!/usr/bin/bash

is_prime() {
    number="$1"
    if (( number <= 1 )); then
        return 1 
    fi

    for ((i = 2; i <= number / 2; i++)); do
        if (( number % i == 0 )); then
            return 1
        fi
    done

    return 0  
}

while true; do
    echo "Menu:"
    echo "1. Check if a number is prime"
    echo "2. Exit"

    read -p "Enter your choice: " choice

    case "$choice" in
        1)
            read -p "Enter your number: " number
            if (( number < 0 )); then
                echo "Error: Please enter a non-negative number."
            elif is_prime "$number"; then
                echo "$number is a prime number."
            else
                echo "$number is not a prime number."
            fi
            ;;
        2)
            echo "Exiting the program."
            break
            ;;
        *)
            echo "Invalid choice. Please select a valid option (1 or 2)."
            ;;
    esac
done
