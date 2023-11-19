#!/usr/bin/bash

create_file() {
    file_name="$1"
    read -p "Enter the content to write to the file (Press Enter to finish): " content
    if [ -n "$content" ]; then
        echo "$content" > "$file_name"
        echo "File '$file_name' created and written successfully."
    else
        echo "No content provided. File creation aborted."
    fi
}

read_file() {
    file_name="$1"
    if [ -f "$file_name" ]; then
        echo "Contents of '$file_name':"
        cat "$file_name"
    else
        echo "The file '$file_name' does not exist."
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Create a File and Write to it"
    echo "2. Read a File"
    echo "3. Exit"

    read -p "Enter your choice (1/2/3): " choice

    if [ "$choice" = "1" ]; then
        read -p "Enter the name of the file to create: " file_name
        create_file "$file_name"
    elif [ "$choice" = "2" ]; then
        read -p "Enter the name of the file to read: " file_name
        read_file "$file_name"
    elif [ "$choice" = "3" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, or 3."
    fi
done
