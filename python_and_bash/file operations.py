
import filecmp

def create_and_write_file(file_path):
    try:
        content = input(f"Enter content for {file_path}: ")
        with open(file_path, 'w') as file:
            file.write(content)
        print(f"Content has been written to {file_path}.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

def read_file(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.read()
        print(f"Contents of {file_path}:\n{content}")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

def are_files_equal(file1, file2):
    return filecmp.cmp(file1, file2)

while True:
    print("\nMenu:")
    print("1. Create and Write to File 1")
    print("2. Create and Write to File 2")
    print("3. Read File 1")
    print("4. Read File 2")
    print("5. Compare File Contents")
    print("6. Exit")

    choice = input("Enter your choice (1/2/3/4/5/6): ")

    if choice == "1":
        file1_path = input("Enter path for File 1: ")
        create_and_write_file(file1_path)
    elif choice == "2":
        file2_path = input("Enter path for File 2: ")
        create_and_write_file(file2_path)
    elif choice == "3":
        if "file1_path" not in locals():
            print("File 1 has not been created and written to yet.")
        else:
            read_file(file1_path)
    elif choice == "4":
        if "file2_path" not in locals():
            print("File 2 has not been created and written to yet.")
        else:
            read_file(file2_path)
    elif choice == "5":
        if "file1_path" not in locals() or "file2_path" not in locals():
            print("Please create and write to both files first.")
        else:
            if are_files_equal(file1_path, file2_path):
                print("The contents of the two files are the same.")
            else:
                print("The contents of the two files are different.")
    elif choice == "6":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3, 4, 5, or 6.")
