import math

def calculate_circle_area(radius):
    return math.pi * radius ** 2

def calculate_circle_circumference(radius):
    return 2 * math.pi * radius

while True:
    print("______________ Menu: _______________")
    print("1. Calculate area of a circle")
    print("2. Calculate circumference of a circle")
    print("3. Exit")
    
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        radius = float(input("Enter the radius of the circle: "))
        if radius < 0:
            print("Error ! Please enter a non-negative radius.")
        else:
            area = calculate_circle_area(radius)
            print(f"The area of the circle is: {area}")
    elif choice == 2:
        radius = float(input("Enter the radius of the circle: "))
        if radius < 0:
            print("Error ! Please enter a non-negative radius.")
        else:
            circumference = calculate_circle_circumference(radius)
            print(f"The circumference of the circle is: {circumference}")
    elif choice == 3:
        print("Exiting the program.")
        break
    else:
        print("Error ! Invalid choice. Please select a valid option.")
