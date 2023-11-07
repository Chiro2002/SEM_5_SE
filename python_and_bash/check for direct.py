
import os

def check_directory_existence(directory_name):
    if os.path.exists(directory_name):
        print(f"Directory '{directory_name}' exists.")
    else:
        print(f"Directory '{directory_name}' does not exist.")

def create_directory(directory_name):
    if not os.path.exists(directory_name):
        os.mkdir(directory_name)
        print(f"Directory '{directory_name}' created successfully.")
    else:
        print(f"Directory '{directory_name}' already exists.")

while True:
    print("\nMenu:")
    print("1. Check if Directory Exists")
    print("2. Create Directory")
    print("3. Exit")
    
    choice = input("Enter your choice (1/2/3): ")
    
    if choice == "1":
        directory_name = input("Enter the directory name: ")
        check_directory_existence(directory_name)
    elif choice == "2":
        directory_name = input("Enter the directory name: ")
        create_directory(directory_name)
    elif choice == "3":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
