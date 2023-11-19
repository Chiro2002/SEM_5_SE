def is_prime(number):
    if number <= 1:
        return False
    for i in range(2, int(number/2) + 1):
        if number % i == 0:
            return False
    return True

while True:
    print("Menu:")
    print("1. Check if a number is prime")
    print("2. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        number = int(input("Enter your number: "))
        if is_prime(number):
            print(number, "is a prime number.")
        else:
            print(number, "is not a prime number.")
    elif choice == 2:
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please select a valid option.")

