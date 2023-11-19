def calculate_division(percentage):
    if percentage >= 75:
        return "1st Division"
    elif percentage >= 60:
        return "2nd Division"
    elif percentage >= 40:
        return "3rd Division"
    else:
        return "Fail"

while True:
    print("Menu:")
    print("1. Calculate division or result")
    print("2. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        num_subjects = int(input("Enter the number of subjects: "))
        total_marks = 0

        for i in range(num_subjects):
            marks = float(input(f"Enter the marks for subject {i+1}: "))
            total_marks += marks

        total_marks_obtained = total_marks
        total_marks_possible = num_subjects * 100
        percentage = (total_marks_obtained / total_marks_possible) * 100

        division = calculate_division(percentage)
        print(f"You achieved {percentage:.2f}% and got {division}.")
    elif choice == 2:
        print("Exiting the program.")
        break
    else:
        print("Error !Invalid choice. Please select a valid option.")
