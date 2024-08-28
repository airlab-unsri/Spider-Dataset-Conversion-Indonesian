import csv
import os
import re
from googletrans import Translator

def load_sql_keywords(filepath):
    """
    Loads SQL keywords from a file, one keyword per line.

    Parameters:
        - filepath (str): The path to the file containing SQL keywords.

    Returns:
        - set: A set of SQL keywords.
    """
    try:
        with open(filepath, 'r') as file:
            keywords = set(line.strip().lower() for line in file)
        return keywords
    except FileNotFoundError:
        print(f"Error: SQL keywords file '{filepath}' not found.")
        return set()

def is_translatable(text, sql_keywords):
    """
    Checks if the text is translatable (i.e., it's not a number, symbol, or SQL keyword).

    Parameters:
        - text (str): The text to check.
        - sql_keywords (set): A set of SQL keywords to skip.

    Returns:
        - bool: True if the text is translatable, False otherwise.
    """
    if not text or text.isspace() or text.lower() in sql_keywords:
        return False
    # Skip if text is numeric or contains only symbols
    if text.isdigit() or re.match(r'^[^\w\s]+$', text):
        return False
    return True

def translate_column(csv_filename, column_name, sql_keywords=None):
    """
    Translates the specified column in a CSV file from English to Indonesian.

    Parameters:
        - csv_filename (str): The name of the CSV file (including the .csv extension).
        - column_name (str): The name of the column to translate.
        - sql_keywords (set): A set of SQL keywords to skip (optional).
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
                    text = row[column_name]
                    if is_translatable(text, sql_keywords):
                        translated_text = translator.translate(text, src='en', dest='id').text
                        row[column_name + "_id"] = translated_text if translated_text else text
                    else:
                        row[column_name + "_id"] = text  # Copy original if not translatable
                except Exception as e:
                    print(f"Error translating row: {text}. Error: {e}")
                    row[column_name + "_id"] = text  # Keep original text on error

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
    script_dir = os.path.dirname(os.path.abspath(__file__))
    sql_keywords_filepath = os.path.join(script_dir, '../data/sql_keywords.txt')
    sql_keywords = load_sql_keywords(sql_keywords_filepath)

    for csv_filename, column_names in file_column_pairs.items():
        for column_name in column_names:
            translate_column(csv_filename, column_name, sql_keywords)

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
        translate_column(csv_filename, column_name, load_sql_keywords('../data/sql_keywords.txt'))
    
    elif choice == '2':
        # Auto-translate mode: define the files and columns to be translated
        file_column_pairs = {
            # 'dev.csv': ['db_id', 'query_toks', 'question'],
            'train_others.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider.csv': ['db_id', 'query_toks', 'question'],
            # 'tables.csv': ['db_id','toks']
        }
        auto_translate(file_column_pairs)
    
    else:
        # Handle invalid input
        print("Invalid choice. Please enter 1 or 2.")
