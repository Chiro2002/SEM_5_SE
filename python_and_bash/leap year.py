def is_leap_year(year):
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):  
        return True
    return False

def generate_leap_years(start_year, count):
    leap_years = []
    year = start_year

    while len(leap_years) < count:
        if is_leap_year(year):
            leap_years.append(year)
        year += 1

    return leap_years

while True:
    print("\nMenu:")
    print("1. Generate and Display Leap Years")
    print("2. Exit")

    choice = input("Enter your choice (1/2): ")

    if choice == "1":
        leap_years = generate_leap_years(2000, 10)
        print("The first 10 leap years starting from the year 2000 are:")
        for year in leap_years:
            print(year)
    elif choice == "2":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1 or 2.")
