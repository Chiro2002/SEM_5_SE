#!/bin/bash

# Check for the input folder and target folder as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 source_folder target_folder"
    exit 1
fi

source_folder="$1"
target_folder="$2"

# Ensure the source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Source folder does not exist: $source_folder"
    exit 1
fi

# Ensure the target folder exists
if [ ! -d "$target_folder" ]; then
    echo "Target folder does not exist: $target_folder"
    exit 1
fi

# Create an associative array to store MD5 hashes
declare -A md5_hashes

# Find and move duplicate files to the target folder
find "$source_folder" -type f -exec md5sum {} + | while read -r md5sum file; do
    if [ -n "${md5_hashes[$md5sum]}" ]; then
        mv "$file" "$target_folder"
        echo "Moved duplicate file: $file"
    else
        md5_hashes[$md5sum]=1
    fi
done

echo "Duplicate files have been moved to $target_folder"

