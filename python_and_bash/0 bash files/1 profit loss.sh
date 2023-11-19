#!/usr/bin/bash

while true; do
    echo "______________ Menu: _______________"
    echo "1. Calculate profit or loss"
    echo "2. Check for negative numbers"
    echo "3. Exit"

    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the cost price: " CP
        read -p "Enter the selling price: " SP

        if (( CP < 0 || SP < 0 )); then
            echo "Error! Please enter non-negative values for cost price and selling price."
        elif (( CP > SP )); then
            loss=$(bc <<< "$CP - $SP")
            loss_percentage=$(bc <<< "scale=2; ($loss / $CP) * 100")
            echo "You have made a loss of: $loss"
            echo "Loss percentage: $loss_percentage%"
        elif (( SP > CP )); then
            profit=$(bc <<< "$SP - $CP")
            profit_percentage=$(bc <<< "scale=2; ($profit / $CP) * 100")
            echo "You have made a profit of: $profit"
            echo "Profit percentage: $profit_percentage%"
        else
            echo "You have made neither profit nor loss"
        fi
    elif [ "$choice" -eq 2 ]; then
        read -p "Enter a number: " num
        if (( num < 0 )); then
            echo "You have entered a negative number."
        else
            echo "You have entered a non-negative number."
        fi
    elif [ "$choice" -eq 3 ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
