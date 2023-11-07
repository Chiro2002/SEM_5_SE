def check_number_type(number):
    if number % 2 == 0:
        return "Even"
    else:
        return "Odd"

while True:
    print("______________ Menu: _______________")
    print("1. Check if a number is even or odd")
    print("2. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        number = int(input("Enter your number: "))
        number_type = check_number_type(number)
        print(f"Your number is {number_type}")
    elif choice == 2:
        print("Exiting the program.")
        break
    else:
        print("Error !Invalid choice. Please select a valid option.")
