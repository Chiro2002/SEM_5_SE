
def factorial(n):
    if n < 0:
        return "Factorial is not defined for negative numbers"
    elif n == 0:
        return 1
    else:
        result = 1
        for i in range(1, n + 1):
            result *= i
        return result

while True:
    print("\nMenu:")
    print("1. Calculate Factorial")
    print("2. Exit")

    choice = input("Enter your choice (1/2): ")

    if choice == "1":
        try:
            num = int(input("Enter a non-negative integer: "))
            print(f"The factorial of {num} is {factorial(num)}")
        except ValueError:
            print("Invalid input. Please enter a non-negative integer.")
    elif choice == "2":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1 or 2.")
