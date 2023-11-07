# #!/usr/bin/bash

# create_and_write_file() {
#     file_path="$1"
#     read -p "Enter content for $file_path: " content
#     echo "$content" > "$file_path"
#     echo "Content has been written to $file_path."
# }

# read_file() {
#     file_path="$1"
#     if [ -f "$file_path" ]; then
#         echo "Contents of $file_path:"
#         cat "$file_path"
#     else
#         echo "File $file_path does not exist."
#     fi
# }

# are_files_equal() {
#     file1="$1"
#     file2="$2"
#     if cmp -s "$file1" "$file2"; then
#         echo "The contents of the two files are the same."
#     else
#         echo "The contents of the two files are different."
#     fi
# }

# while true; do
#     echo -e "\nMenu:"
#     echo "1. Create and Write to File 1"
#     echo "2. Create and Write to File 2"
#     echo "3. Read File 1"
#     echo "4. Read File 2"
#     echo "5. Compare File Contents"
#     echo "6. Exit"

#     read -p "Enter your choice (1/2/3/4/5/6): " choice

#     if [ "$choice" = "1" ]; then
#         read -p "Enter path for File 1: " file1_path
#         create_and_write_file "$file1_path"
#     elif [ "$choice" = "2" ]; then
#         read -p "Enter path for File 2: " file2_path
#         create_and_write_file "$file2_path"
#     elif [ "$choice" = "3" ]; then
#         if [ -n "$file1_path" ]; then
#             read_file "$file1_path"
#         else
#             echo "File 1 has not been created and written to yet."
#         fi
#     elif [ "$choice" = "4" ]; then
#         if [ -n "$file2_path" ]; then
#             read_file "$file2_path"
#         else
#             echo "File 2 has not been created and written to yet."
#         fi
#     elif [ "$choice" = "5" ]; then
#         if [ -n "$file1_path" ] && [ -n "$file2_path" ]; then
#             are_files_equal "$file1_path" "$file2_path"
#         else
#             echo "Please create and write to both files first."
#         fi
#     elif [ "$choice" = "6" ]; then
#         echo "Exiting the program."
#         break
#     else
#         echo "Invalid choice. Please enter 1, 2, 3, 4, 5, or 6."
#     fi
# done

#!/usr/bin/bash

create_and_write_file() {
    read -p "Enter the name of the file to create: " file_name
    if [ -z "$file_name" ]; then
        echo "File name cannot be empty. Aborting file creation."
        return
    fi

    if [ -f "$file_name" ]; then
        echo "File '$file_name' already exists."
        return
    fi

    read -p "Enter content for $file_name (Press Ctrl+D to finish): " content
    echo "$content" > "$file_name"
    echo "Content has been written to '$file_name'."
}

read_file() {
    read -p "Enter the name of the file to read: " file_name
    if [ -z "$file_name" ]; then
        echo "File name cannot be empty. Aborting file reading."
        return
    fi

    if [ -f "$file_name" ]; then
        echo "Contents of '$file_name':"
        cat "$file_name"
    else
        echo "File '$file_name' does not exist."
    fi
}

are_files_equal() {
    read -p "Enter the name of File 1: " file1
    read -p "Enter the name of File 2: " file2

    if [ -z "$file1" ] || [ -z "$file2" ]; then
        echo "File names cannot be empty. Aborting comparison."
        return
    fi

    if [ -f "$file1" ] && [ -f "$file2" ]; then
        if cmp -s "$file1" "$file2"; then
            echo "The contents of the two files are the same."
        else
            echo "The contents of the two files are different."
        fi
    else
        echo "One or both files do not exist."
    fi
}

while true; do
    echo -e "\nMenu:"
    echo "1. Create and Write to a File"
    echo "2. Read a File"
    echo "3. Compare File Contents"
    echo "4. Exit"

    read -p "Enter your choice (1/2/3/4): " choice

    if [ "$choice" = "1" ]; then
        create_and_write_file
    elif [ "$choice" = "2" ]; then
        read_file
    elif [ "$choice" = "3" ]; then
        are_files_equal
    elif [ "$choice" = "4" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, 3, or 4."
    fi
done

