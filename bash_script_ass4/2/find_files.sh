#!/bin/bash

# Check for the input directory path as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

directory_path="$1"

# Ensure the specified directory exists
if [ ! -d "$directory_path" ]; then
    echo "Directory does not exist: $directory_path"
    exit 1
fi

# Find the top 10 files created in the last 20 days in the specified directory
find "$directory_path" -type f -ctime -20 -exec du -h {} \; | sort -rh | head -n 10
