#!/usr/bin/bash

print_numeric_pyramid() {
    rows="$1"

    echo "Select the type of pyramid:"
    echo "1. Left Pyramid"
    echo "2. Center Pyramid"
    echo "3. Right Pyramid"

    read -p "Enter your choice (1/2/3): " choice

    case "$choice" in
        "1")
            for ((i = 1; i <= rows; i++)); do
                for ((j = 1; j <= i; j++)); do
                    echo -n "$j "
                done
                echo
            done
            ;;
        "2")
            for ((i = 1; i <= rows; i++)); do
                for ((s = 1; s <= rows - i; s++)); do
                    echo -n " "
                done
                for ((j = 1; j <= 2 * i - 1; j++)); do
                    echo -n "$j"
                done
                echo
            done
            ;;
        "3")
            for ((i = 1; i <= rows; i++)); do
                for ((s = 1; s <= rows - i; s++)); do
                    echo -n "  "
                done
                for ((j = 1; j <= i; j++)); do
                    echo -n "$j "
                done
                echo
            done
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
}


print_special_character_pyramid() {
    rows="$1"

    echo "Select the type of special character pyramid:"
    echo "1. Left Pyramid"
    echo "2. Center Pyramid"
    echo "3. Right Pyramid"

    read -p "Enter your choice (1/2/3): " choice

    case "$choice" in
        "1")
            character="$2"
            for ((i = 1; i <= rows; i++)); do
                for ((j = 1; j <= i; j++)); do
                    echo -n "$character"
                done
                echo
            done
            ;;
        "2")
           character="$2"
            for ((i = 1; i <= rows; i++)); do
                spaces_before=$((rows - i))
                characters=$((2 * i - 1))
                spaces_after=$((rows - i))
                printf "%${spaces_before}s"
                for ((j = 1; j <= characters; j++)); do
                    echo -n "$character"
                done
                printf "%${spaces_after}s\n"
            done
                ;;
        "3")
            character="$2"
            for ((i = 1; i <= rows; i++)); do
                spaces=$((rows - i))
                characters=$((2 * i - 1))
                printf "%${spaces}s"
                for ((j = 1; j <= i; j++)); do
                    echo -n "$character"
                done
                echo
            done
            ;;
        *)
            echo "Invalid pyramid type. Please use '1' for left, '2' for center, or '3' for right."
            ;;
    esac
}

while true; do
    echo -e "\nMenu:"
    echo "1. Print Numeric Pyramid"
    echo "2. Print Special Character Pyramid"
    echo "3. Print Combined Pyramid"
    echo "4. Exit"

    read -p "Enter your choice (1/2/3/4): " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the number of rows for the numeric pyramid: " rows
        print_numeric_pyramid "$rows"
    elif [ "$choice" -eq 2 ]; then
        read -p "Enter the number of rows for the special character pyramid: " rows
        read -p "Enter the special character to use: " character
        print_special_character_pyramid "$rows" "$character"
    elif [ "$choice" -eq 3 ]; then
        read -p "Enter the number of rows for the combined pyramid: " rows
        echo "Numeric Pyramid:"
        print_numeric_pyramid "$rows"
        read -p "Enter the special character to use: " character
        echo "Special Character Pyramid:"
        print_special_character_pyramid "$rows" "$character"
    elif [ "$choice" -eq 4 ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, 3, or 4."
    fi
done


