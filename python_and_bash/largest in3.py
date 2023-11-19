def find_largest(num1, num2, num3):
    if num1 >= num2 and num1 >= num3:
        return num1
    elif num2 >= num1 and num2 >= num3:
        return num2
    else:
        return num3

print("Select an option:")
print("1. Find the largest of three numbers")
print("2. Exit")

while True:
    choice = int(input("Enter choice (1/2): "))

    if choice == 1:
        num1 = float(input("Enter the first number: "))
        num2 = float(input("Enter the second number: "))
        num3 = float(input("Enter the third number: "))
        
        largest = find_largest(num1, num2, num3)
        print("The largest number is:", largest)
    elif choice == 2:
        print("Exiting the program.")
        break
    else:
        print("Error !Invalid choice. Please select 1 or 2.")
