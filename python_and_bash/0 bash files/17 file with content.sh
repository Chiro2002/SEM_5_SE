
#!/usr/bin/bash

create_file_with_contents() {
    content="Cat\ndog\nbear\nhello\nelephant\nhello\ntiger\nhello\nhorse\n"
    echo -e "$content" > "myfile.txt"
    echo "File created with contents."
}

delete_lines_with_hello() {
    sed '/hello/d' "myfile.txt" > "modified_file.txt"
    echo "Lines containing 'hello' deleted."
}

display_original_file() {
    if [ -f "myfile.txt" ]; then
        cat "myfile.txt"
    else
        echo "The original file does not exist."
    fi
}

display_modified_file() {
    if [ -f "modified_file.txt" ]; then
        cat "modified_file.txt"
    else
        echo "The modified file does not exist."
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Create File with Contents"
    echo "2. Delete Lines Containing 'hello'"
    echo "3. Display Original File"
    echo "4. Display Modified File"
    echo "5. Exit"

    read -p "Enter your choice (1/2/3/4/5): " choice

    if [ "$choice" = "1" ]; then
        create_file_with_contents
    elif [ "$choice" = "2" ]; then
        delete_lines_with_hello
    elif [ "$choice" = "3" ]; then
        display_original_file
    elif [ "$choice" = "4" ]; then
        display_modified_file
    elif [ "$choice" = "5" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, 3, 4, or 5."
    fi
done


