#!/usr/bin/bash

check_directory_existence() {
    directory_name="$1"
    if [ -d "$directory_name" ]; then
        echo "Directory '$directory_name' exists."
    else
        echo "Directory '$directory_name' does not exist."
    fi
}

create_directory() {
    directory_name="$1"
    if [ ! -d "$directory_name" ]; then
        mkdir "$directory_name"
        echo "Directory '$directory_name' created successfully."
    else
        echo "Directory '$directory_name' already exists."
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Check if Directory Exists"
    echo "2. Create Directory"
    echo "3. Exit"

    read -p "Enter your choice (1/2/3): " choice

    if [ "$choice" = "1" ]; then
        read -p "Enter the directory name: " directory_name
        check_directory_existence "$directory_name"
    elif [ "$choice" = "2" ]; then
        read -p "Enter the directory name: " directory_name
        create_directory "$directory_name"
    elif [ "$choice" = "3" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, or 3."
    fi
done
