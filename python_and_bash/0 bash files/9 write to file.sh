#!/usr/bin/bash

write_hello_to_file() {
    filename="$1"
    if [ -e "$filename" ]; then
        echo "File '$filename' exists."
    else
        touch "$filename"
        echo "File '$filename' didn't exist. File created."
    fi

    echo "Hello, world!" > "$filename"
    echo "'Hello, world!' written to '$filename'."
}

while true; do
    echo "Select an option:"
    echo "1. Check if the file exists and write 'Hello, world!'"
    echo "2. Exit"

    read -p "Enter choice (1/2): " choice

    if [ "$choice" -eq 1 ]; then
        filename="hello.txt"
        write_hello_to_file "$filename"
    elif [ "$choice" -eq 2 ]; then
        echo "Exiting the program."
        break
    else
        echo "Error! Invalid choice. Please select 1 or 2."
    fi
done
