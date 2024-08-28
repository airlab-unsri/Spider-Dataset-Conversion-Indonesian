import csv
import os
from googletrans import Translator

def translate_column(csv_filename, column_name):
    """
    Translates the specified column in a CSV file from English to Indonesian.

    Parameters:
        - csv_filename (str): The name of the CSV file (including the .csv extension).
        - column_name (str): The name of the column to translate.
    """
    # Initialize the Google Translator
    translator = Translator()
    
    # Get the absolute path of the current script to locate the CSV file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filename = os.path.join(script_dir, '../data/extracted/', csv_filename)
    
    # Check if the specified file exists
    if not os.path.isfile(csv_filename):
        print(f"Error: File '{csv_filename}' does not exist.")
        return
    
    # Try to open and process the CSV file
    try:
        with open(csv_filename, mode='r', encoding='utf-8') as csv_file:
            reader = csv.DictReader(csv_file)
            rows = list(reader)
            
            # Check if the specified column exists in the CSV file
            if column_name not in reader.fieldnames:
                print(f"Error: Column '{column_name}' not found in the file.")
                return
            
            # Translate the content of the specified column and add a new column with translated text
            for row in rows:
                try:
                    # Add translated text to a new column named "<column_name>_id"
                    row[column_name + "_id"] = translator.translate(row[column_name], src='en', dest='id').text
                except Exception as e:
                    print(f"Error translating row: {row[column_name]}. Error: {e}")
                    return

        # Define the output directory and file name
        output_dir = os.path.join(script_dir, '../data/extracted/')
        output_filename = os.path.join(output_dir, 'translated_' + os.path.basename(csv_filename))

        # Write the translated content back to a new CSV file
        with open(output_filename, mode='w', newline='', encoding='utf-8') as output_file:
            writer = csv.DictWriter(output_file, fieldnames=reader.fieldnames + [column_name + "_id"])
            writer.writeheader()
            writer.writerows(rows)
        
        print("Translation completed. Output saved as:", output_filename)
    
    except Exception as e:
        print(f"An error occurred while processing the file: {e}")

def auto_translate(file_column_pairs):
    """
    Automatically translates specified columns in multiple CSV files from English to Indonesian.

    Parameters:
        - file_column_pairs (dict): A dictionary where the key is the CSV file name and the value is a list of column names to translate.
    """
    for csv_filename, column_names in file_column_pairs.items():
        for column_name in column_names:
            translate_column(csv_filename, column_name)

if __name__ == "__main__":
    """
    Main function to manage the translation process.
    """
    
    # Prompt the user to choose between manual input or auto-translate
    choice = input("Choose an option (1: Manual Input, 2: Auto-Translate): ")
    
    if choice == '1':
        # Manual input mode: prompt the user for the CSV file name and column name to translate
        csv_filename = input("Enter the name of the CSV file (including .csv extension): ")
        column_name = input("Enter the name of the column to translate: ")
        translate_column(csv_filename, column_name)
    
    elif choice == '2':
        # Auto-translate mode: define the files and columns to be translated
        file_column_pairs = {
            'dev.csv': ['db_id', 'query_toks', 'question'],
            'train_others.csv': ['db_id', 'query_toks', 'question'],
            'train_spider.csv': ['db_id', 'query_toks', 'question'],
            'tables.csv': ['db_id','toks']
        }
        auto_translate(file_column_pairs)
    
    else:
        # Handle invalid input
        print("Invalid choice. Please enter 1 or 2.")
