# #!/usr/bin/bash

# is_leap_year() {
#     year="$1"
#     if (( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 )); then
#         return 0  # True
#     else
#         return 1  # False
#     fi
# }

# generate_leap_years() {
#     start_year="$1"
#     count="$2"
#     leap_years=()
#     year="$start_year"

#     while [ ${#leap_years[@]} -lt "$count" ]; do
#         if is_leap_year "$year"; then
#             leap_years+=("$year")
#         fi
#         ((year++))
#     done

#     echo "${leap_years[@]}"
# }

# while true; do
#     echo -e "\nMenu:"
#     echo "1. Generate and Display Leap Years"
#     echo "2. Exit"

#     read -p "Enter your choice (1/2): " choice

#     if [ "$choice" = "1" ]; then
#         leap_years=($(generate_leap_years 2000 10))
#         echo "The first 10 leap years starting from the year 2000 are:"
#         for year in "${leap_years[@]}"; do
#             echo "$year"
#         done
#     elif [ "$choice" = "2" ]; then
#         echo "Exiting the program."
#         break
#     else
#         echo "Invalid choice. Please enter 1 or 2."
#     fi
# done

#!/bin/bash

is_leap_year() {
    year="$1"
    if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; then
        return 0  # True
    else
        return 1  # False
    fi
}

generate_leap_years() {
    start_year="$1"
    count="$2"
    year="$start_year"
    leap_years=""

    while true; do
        if is_leap_year "$year"; then
            if [ -z "$leap_years" ]; then
                leap_years="$year"
            else
                leap_years="$leap_years $year"
            fi
        fi
        year=$((year + 1))
        if [ $(echo "$leap_years" | wc -w) -eq "$count" ]; then
            break
        fi
    done

    echo "$leap_years"
}

while true; do
    echo -e "\nMenu:"
    echo "1. Generate and Display Leap Years"
    echo "2. Exit"

    read -p "Enter your choice (1/2): " choice

    if [ "$choice" = "1" ]; then
        read -p "Enter the starting year: " start_year
        leap_years=$(generate_leap_years "$start_year" 10)
        echo "The first 10 leap years starting from the year $start_year are:"
        echo "$leap_years"
    elif [ "$choice" = "2" ]; then
        echo "Exiting the program."
        break
    else
        echo "Invalid choice. Please enter 1 or 2."
    fi
done





