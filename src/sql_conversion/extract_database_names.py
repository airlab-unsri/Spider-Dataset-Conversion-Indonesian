import os

def extract_folder_names(database_dir, output_file):
    """
    Extract all folder names from a directory and write them to a file.

    Parameters:
        database_dir (str): The path to the directory containing the folders.
        output_file (str): The path to the output file where folder names will be written.
    """
    # Get all folder names in the specified directory
    folder_names = [folder for folder in os.listdir(database_dir) if os.path.isdir(os.path.join(database_dir, folder))]

    # Write folder names to the output file
    with open(output_file, 'w', encoding='utf-8') as f:
        for folder_name in folder_names:
            f.write(f"{folder_name}\n")

def check_pragma_in_file(file_path):
    """
    Check the content of a file to determine which PRAGMA statements it contains.

    Parameters:
        file_path (str): The path to the file to check.

    Returns:
        str: 'off' if PRAGMA foreign_keys=OFF, 'on' if PRAGMA foreign_keys=ON, 'none' if no PRAGMA foreign_keys found.
    """
    pragma_status = 'none'
    if os.path.isfile(file_path):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                if "PRAGMA foreign_keys=OFF;" in content:
                    pragma_status = 'off'
                elif "PRAGMA foreign_keys=ON;" in content or "PRAGMA foreign_keys = ON;" in content:
                    pragma_status = 'on'
        except UnicodeDecodeError:
            print(f"Error decoding file: {file_path}")
    return pragma_status

def classify_databases(database_dir, no_pragma_file, off_pragma_file, on_pragma_file):
    """
    Classify databases based on PRAGMA foreign_keys statements.

    Parameters:
        database_dir (str): The path to the directory containing the databases.
        no_pragma_file (str): The file to save database names with no PRAGMA foreign_keys statements.
        off_pragma_file (str): The file to save database names with PRAGMA foreign_keys=OFF.
        on_pragma_file (str): The file to save database names with PRAGMA foreign_keys=ON.
    """
    # List all folders in the database directory
    folder_names = [folder for folder in os.listdir(database_dir) if os.path.isdir(os.path.join(database_dir, folder))]

    with open(no_pragma_file, 'w', encoding='utf-8') as no_f, open(off_pragma_file, 'w', encoding='utf-8') as off_f, open(on_pragma_file, 'w', encoding='utf-8') as on_f:
        for folder in folder_names:
            # Check the schema.sql or {database_name}.sql file inside each folder
            sql_file = os.path.join(database_dir, folder, f"{folder}.sql")
            if not os.path.isfile(sql_file):
                sql_file = os.path.join(database_dir, folder, "schema.sql")

            pragma_status = check_pragma_in_file(sql_file)
            
            # Write the folder name to the appropriate file based on PRAGMA status
            if pragma_status == 'none':
                no_f.write(f"{folder}\n")
            elif pragma_status == 'off':
                off_f.write(f"{folder}\n")
            elif pragma_status == 'on':
                on_f.write(f"{folder}\n")

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Define the directory containing the database folders
    database_dir = os.path.join(script_dir, '../../data/spider/database/')
    
    # Output file where folder names will be saved
    output_file = os.path.join(script_dir, 'databases.txt')

    # Output files for classifying databases based on PRAGMA foreign_keys
    no_pragma_file = os.path.join(script_dir, 'no_pragma_databases.txt')
    off_pragma_file = os.path.join(script_dir, 'off_pragma_databases.txt')
    on_pragma_file = os.path.join(script_dir, 'on_pragma_databases.txt')

    # Extract folder names and write them to the output file
    extract_folder_names(database_dir, output_file)
    print(f"Folder names written to {output_file}")

    # Classify databases based on PRAGMA statements
    classify_databases(database_dir, no_pragma_file, off_pragma_file, on_pragma_file)
    print(f"Databases classified into {no_pragma_file}, {off_pragma_file}, and {on_pragma_file}")
