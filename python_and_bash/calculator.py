def perform_operation(operand1, operator, operand2):
    if operator == "+":
        return operand1 + operand2
    elif operator == "-":
        return operand1 - operand2
    elif operator == "*":
        return operand1 * operand2
    elif operator == "/":
        if operand2 != 0:
            return operand1 / operand2
        else:
            return "Cannot divide by zero"
    else:
        return "Invalid operator"

while True:
    print("________Select operation:_______")
    print("1. Addition (+)")
    print("2. Subtraction (-)")
    print("3. Multiplication (*)")
    print("4. Division (/)")
    print("5. Exit")

    choice = input("Enter choice (1/2/3/4/5): ")

    if choice == "5":
        print("Exiting the program.")
        break

    if choice in ("1", "2", "3", "4"):
        operand1 = float(input("Enter operand 1: "))
        operand2 = float(input("Enter operand 2: "))

        if choice == "1":
            operator = "+"
        elif choice == "2":
            operator = "-"
        elif choice == "3":
            operator = "*"
        elif choice == "4":
            operator = "/"
        
        result = perform_operation(operand1, operator, operand2)
        print("Result:", result)
    else:
        print("Error !Invalid choice. Please select a valid option.")
