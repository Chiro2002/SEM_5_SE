

def print_numeric_pyramid(rows):
    for i in range(1, rows + 1):
        for j in range(1, i + 1):
            print(j, end=" ")
        print()

def print_special_character_pyramid(rows, character):
    for i in range(1, rows + 1):
        spaces = rows - i
        characters = 2 * i - 1
        print(" " * spaces + character * characters)

while True:
    print("\nMenu:")
    print("1. Print Numeric Pyramid")
    print("2. Print Special Character Pyramid")
    print("3. Print Combined Pyramid")
    print("4. Exit")

    choice = input("Enter your choice (1/2/3/4): ")

    if choice == "1":
        rows = int(input("Enter the number of rows for the numeric pyramid: "))
        print_numeric_pyramid(rows)
    elif choice == "2":
        rows = int(input("Enter the number of rows for the special character pyramid: "))
        character = input("Enter the special character to use: ")
        print_special_character_pyramid(rows, character)
    elif choice == "3":
        rows = int(input("Enter the number of rows for the combined pyramid: "))
        print("Numeric Pyramid:")
        print_numeric_pyramid(rows)
        character = input("Enter the special character to use: ")
        print("Special Character Pyramid:")
        print_special_character_pyramid(rows, character)
    elif choice == "4":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3, or 4.")

