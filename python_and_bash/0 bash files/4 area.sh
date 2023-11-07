#!/usr/bin/bash

function calculate_circle_area() {
    area=$(echo "scale=2; 3.14159 * $1 * $1" | bc)
    echo "The area of the circle is: $area square units"
}

function calculate_circle_circumference() {
    circumference=$(echo "scale=2; 2 * 3.14159 * $1" | bc)
    echo "The circumference of the circle is: $circumference linear units"
}

while true; do
    echo "______________ Menu: _______________"
    echo "1. Calculate area of a circle"
    echo "2. Calculate circumference of a circle"
    echo "3. Exit"

    read -p "Enter your choice: " choice

    if [ $choice -eq 1 ]; then
        read -p "Enter the radius of the circle (in units): " radius
        if (( $(echo "$radius < 0" | bc -l) )); then
            echo "Error! Please enter a non-negative radius."
        else
            calculate_circle_area $radius
        fi
    elif [ $choice -eq 2 ]; then
        read -p "Enter the radius of the circle (in units): " radius
        if (( $(echo "$radius < 0" | bc -l) )); then
            echo "Error! Please enter a non-negative radius."
        else
            calculate_circle_circumference $radius
        fi
    elif [ $choice -eq 3 ]; then
        echo "Exiting the program."
        break
    else
        echo "Error! Invalid choice. Please select a valid option."
    fi
done
