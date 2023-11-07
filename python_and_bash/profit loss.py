while True:
    print("______________ Menu: _______________")
    print("1. Calculate profit or loss")
    print("2. Check for negative numbers")
    print("3. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        CP = float(input("Enter the cost price: "))
        SP = float(input("Enter the selling price: "))
        
        if CP < 0 or SP < 0:
            print("Error ! Please enter non-negative values for cost price and selling price.")
        elif CP > SP:
            print("you have made a loss of:", CP - SP)
        elif SP > CP:
            print("you have made a profit of:", SP - CP)
        else:
            print("You have made neither profit nor loss")
    elif choice == 2:
        num = float(input("Enter a number: "))
        if num < 0:
            print("You have entered a negative number.")
        else:
            print("You have entered a non-negative number.")
    elif choice == 3:
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please select a valid option.")
