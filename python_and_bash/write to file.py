def write_hello_to_file(filename):
    try:
        with open(filename, "w") as file:
            file.write("Hello, world!")
            print(f"'Hello, world!' written to {filename}.")
    except FileNotFoundError:
        with open(filename, "w") as file:
            file.write("Hello, world!")
            print(f"{filename} didn't exist. File created and 'Hello, world!' written.")

def main():
    print("Select an option:")
    print("1. Check if the file exists and write 'Hello, world!'")
    print("2. Exit")

    while True:
        choice = int(input("Enter choice (1/2): "))

        if choice == 1:
            filename = "hello.txt"
            write_hello_to_file(filename)
        elif choice == 2:
            print("Exiting the program.")
            break
        else:
            print("Error !Invalid choice. Please select 1 or 2.")

if __name__ == "__main__":
    main()
