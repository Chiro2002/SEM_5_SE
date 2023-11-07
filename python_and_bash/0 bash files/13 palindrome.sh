#!/usr/bin/bash

is_palindrome() {
    s="$1"
    s="${s// /}"  # Remove spaces
    s="${s,,}"   # Convert to lowercase

    len=${#s}
    if ((len <= 1)); then
        return 0  # Empty string or single character is a palindrome
    fi

    mid=$((len / 2))

    for ((i = 0; i < mid; i++)); do
        j=$((len - i - 1))
        if [[ "${s:$i:1}" != "${s:$j:1}" ]]; then
            return 1  # Not a palindrome
        fi
    done

    return 0  # Palindrome
}

while true; do
    echo -e "\nMenu:"
    echo "1. Check Word Palindrome"
    echo "2. Check Phrase Palindrome"
    echo "3. Check Number Palindrome"
    echo "4. Exit"

    read -p "Enter your choice (1/2/3/4): " choice

    if [ "$choice" = "1" ]; then
        read -p "Enter a word: " input_word
        if [[ -z "$input_word" ]]; then
            echo "Empty input. Please enter a word."
        elif is_palindrome "$input_word"; then
            echo "The word is a palindrome."
        else
            echo "The word is not a palindrome."
        fi
    elif [ "$choice" = "2" ]; then
        read -p "Enter a phrase: " input_phrase
        if [[ -z "$input_phrase" ]]; then
            echo "Empty input. Please enter a phrase."
        elif is_palindrome "$input_phrase"; then
            echo "The phrase is a palindrome."
        else
            echo "The phrase is not a palindrome."
        fi
    elif [ "$choice" = "3" ]; then
        read -p "Enter a number: " input_number
        if [[ -z "$input_number" ]]; then
            echo "Empty input. Please enter a number."
        elif is_palindrome "$input_number"; then
            echo "The number is a palindrome."
        else
            echo "The number is not a palindrome."
        fi
    elif [ "$choice" = "4" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1, 2, 3, or 4."
    fi
done
