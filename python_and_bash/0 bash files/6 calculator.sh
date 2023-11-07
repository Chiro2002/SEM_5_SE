#!/usr/bin/bash

perform_operation() {
    operand1="$1"
    operator="$2"
    operand2="$3"

    if [ "$operator" = "+" ]; then
        echo "scale=2; $operand1 + $operand2" | bc
    elif [ "$operator" = "-" ]; then
        echo "scale=2; $operand1 - $operand2" | bc
    elif [ "$operator" = "*" ]; then
        echo "scale=2; $operand1 * $operand2" | bc
    elif [ "$operator" = "/" ]; then
        if (( $(echo "$operand2 != 0" | bc -l) )); then
            echo "scale=2; $operand1 / $operand2" | bc
        else
            echo "Cannot divide by zero"
        fi
    else
        echo "Invalid operator"
    fi
}

while true; do
    echo "________Select operation:_______"
    echo "1. Addition (+)"
    echo "2. Subtraction (-)"
    echo "3. Multiplication (*)"
    echo "4. Division (/)"
    echo "5. Exit"

    read -p "Enter choice (1/2/3/4/5): " choice

    if [ "$choice" = "5" ]; then
        echo "Exiting the program."
        break
    fi

    if [ "$choice" -ge 1 ] && [ "$choice" -le 4 ]; then
        read -p "Enter operand 1: " operand1
        read -p "Enter operand 2: " operand2

        if [ "$choice" -eq 1 ]; then
            operator="+"
        elif [ "$choice" -eq 2 ]; then
            operator="-"
        elif [ "$choice" -eq 3 ]; then
            operator="*"
        elif [ "$choice" -eq 4 ]; then
            operator="/"
        fi

        result=$(perform_operation "$operand1" "$operator" "$operand2")
        echo "Result: $result"
    else
        echo "Error ! Invalid choice. Please select a valid option."
    fi
done
