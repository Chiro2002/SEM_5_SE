#!/usr/bin/bash

calculate_division() {
    percentage="$1"
    if (( $(echo "$percentage >= 75" | bc -l) )); then
        echo "1st Division"
    elif (( $(echo "$percentage >= 60" | bc -l) )); then
        echo "2nd Division"
    elif (( $(echo "$percentage >= 40" | bc -l) )); then
        echo "3rd Division"
    else
        echo "Fail"
    fi
}

while true; do
    echo "Menu:"
    echo "1. Calculate division or result"
    echo "2. Exit"

    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        read -p "Enter the number of subjects: " num_subjects
        total_marks=0

        for ((i=1; i<=$num_subjects; i++)); do
            read -p "Enter the marks for subject $i: " marks
            total_marks=$(echo "scale=2; $total_marks + $marks" | bc)
        done

        total_marks_obtained="$total_marks"
        total_marks_possible=$((num_subjects * 100))
        percentage=$(echo "scale=2; ($total_marks_obtained / $total_marks_possible) * 100" | bc)

        division=$(calculate_division "$percentage")
        echo "Congratuations !! You achieved $percentage% and got $division."
    elif [ "$choice" -eq 2 ]; then
        echo "Exiting the program."
        break
    else
        echo "Error ! Invalid choice. Please select a valid option."
    fi
done
