def create_file_with_contents():
    try:
        content = "Cat\ndog\nbear\nhello\nelephant\nhello\ntiger\nhello\nhorse\n"
        with open("myfile.txt", "w") as file:
            file.write(content)
        print("File created with contents.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

def delete_lines_with_hello():
    try:
        with open("myfile.txt", "r") as input_file, open("modified_file.txt", "w") as output_file:
            for line in input_file:
                if "hello" not in line:
                    output_file.write(line)
        print("Lines containing 'hello' deleted.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

def display_modified_file():
    try:
        with open("modified_file.txt", "r") as modified_file:
            print(modified_file.read())
    except Exception as e:
        print(f"An error occurred: {str(e)}")

while True:
    print("\nMenu:")
    print("1. Create File with Contents")
    print("2. Delete Lines Containing 'hello'")
    print("3. Display Modified File")
    print("4. Exit")

    choice = input("Enter your choice (1/2/3/4): ")

    if choice == "1":
        create_file_with_contents()
    elif choice == "2":
        delete_lines_with_hello()
    elif choice == "3":
        display_modified_file()
    elif choice == "4":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3, or 4.")
