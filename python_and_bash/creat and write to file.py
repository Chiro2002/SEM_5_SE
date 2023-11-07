

def create_file(file_name):
    try:
        with open(file_name, 'w') as file:
            content = input("Enter the content to write to the file (Press Enter to finish):\n")
            file.write(content)
        print(f"File '{file_name}' created and written successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

def read_file(file_name):
    try:
        with open(file_name, 'r') as file:
            print(f"Contents of '{file_name}':")
            for line in file:
                print(line.strip())
    except FileNotFoundError:
        print(f"The file '{file_name}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

while True:
    print("\nMenu:")
    print("1. Create a File and Write to it")
    print("2. Read a File")
    print("3. Exit")

    choice = input("Enter your choice (1/2/3): ")

    if choice == "1":
        file_name = input("Enter the name of the file to create: ")
        create_file(file_name)
    elif choice == "2":
        file_name = input("Enter the name of the file to read: ")
        read_file(file_name)
    elif choice == "3":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
