def modify_content(content):
    # convert all text to uppercase
    return content.upper()

def main():
    filename = input("Enter the name of the file to read from: ")

    try:
        # Try to open and read the file
        with open(filename, 'r') as file:
            content = file.read()

        # Modify the content
        modified_content = modify_content(content)
        

        # Write the modified content to a new file
        new_filename = "modified_" + filename
        with open(new_filename, 'w') as new_file:
            new_file.write(modified_content)
            
            

        print(f"Modified content has been written to '{new_filename}' successfully!")

    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
    except IOError:
        print(f"Error: Unable to read the file '{filename}'.")
        

if __name__ == "__main__":
    main()
