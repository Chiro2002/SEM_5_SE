def is_palindrome(s):
    s = s.replace(" ", "").lower()
    
    return s == s[::-1]

while True:
    print("\nMenu:")
    print("1. Check Word Palindrome")
    print("2. Check Phrase Palindrome")
    print("3. Check Number Palindrome")
    print("4. Exit")

    choice = input("Enter your choice (1/2/3/4): ")

    if choice == "1":
        input_word = input("Enter a word: ")
        if is_palindrome(input_word):
            print("The word is a palindrome.")
        else:
            print("The word is not a palindrome.")
    elif choice == "2":
        input_phrase = input("Enter a phrase: ")
        if is_palindrome(input_phrase):
            print("The phrase is a palindrome.")
        else:
            print("The phrase is not a palindrome.")
    elif choice == "3":
        input_number = input("Enter a number: ")
        if is_palindrome(input_number):
            print("The number is a palindrome.")
        else:
            print("The number is not a palindrome.")
    elif choice == "4":
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter 1, 2, 3, or 4.")

