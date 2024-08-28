import csv
import os
import re
from googletrans import Translator
import concurrent.futures

def load_sql_keywords(filepath):
    """
    Load SQL keywords from a file into a set.

    Args:
        filepath (str): The path to the file containing SQL keywords.

    Returns:
        set: A set of SQL keywords.
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
    Determine if a given text is translatable.

    Args:
        text (str): The text to check.
        sql_keywords (set): A set of SQL keywords to exclude from translation.

    Returns:
        bool: True if the text is translatable, False otherwise.
    """
    if not text or text.isspace() or text.lower() in sql_keywords:
        return False
    if text.isdigit() or re.match(r'^[^\w\s]+$', text):
        return False
    return True

def translate_text(text, src_lang='en', dest_lang='id'):
    """
    Translate a given text from the source language to the destination language.

    Args:
        text (str): The text to translate.
        src_lang (str): The source language (default is 'en').
        dest_lang (str): The destination language (default is 'id').

    Returns:
        str: The translated text.
    """
    translator = Translator()
    try:
        translation = translator.translate(text, src=src_lang, dest=dest_lang)
        return translation.text
    except Exception as e:
        print(f"Error during translation: {e}")
        return text  # Return the original text in case of translation failure

def translate_column_bulk(rows, column_name, sql_keywords=None):
    """
    Translate the values of a specific column in bulk using multithreading.

    Args:
        rows (list): A list of dictionaries representing the CSV rows.
        column_name (str): The name of the column to translate.
        sql_keywords (set): A set of SQL keywords to exclude from translation.
    """
    with concurrent.futures.ThreadPoolExecutor() as executor:
        translations = list(executor.map(
            lambda row: translate_text(row[column_name], src_lang='en', dest_lang='id') 
            if is_translatable(row[column_name], sql_keywords) 
            else row[column_name], 
            rows
        ))
    
    for i, row in enumerate(rows):
        row[column_name + "_id"] = translations[i]

def translate_and_save(csv_filename, column_names, sql_keywords=None):
    """
    Translate specified columns in a CSV file and save the result.

    Args:
        csv_filename (str): The name of the CSV file to translate.
        column_names (list): A list of column names to translate.
        sql_keywords (set): A set of SQL keywords to exclude from translation.
    """
    # Define the path to the CSV file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filename = os.path.join(script_dir, '../data/extracted/', csv_filename)
    
    if not os.path.isfile(csv_filename):
        print(f"Error: File '{csv_filename}' does not exist.")
        return
    
    try:
        # Read the CSV file into a list of dictionaries
        with open(csv_filename, mode='r', encoding='utf-8') as csv_file:
            reader = csv.DictReader(csv_file)
            rows = list(reader)
            
            # Translate each specified column
            for column_name in column_names:
                if column_name in reader.fieldnames:
                    print(f"Translating column: {column_name} of {csv_filename}...")
                    translate_column_bulk(rows, column_name, sql_keywords)
                else:
                    print(f"Error: Column '{column_name}' not found in the file.")
                    return
            
        # Define the output file path
        output_dir = os.path.join(script_dir, '../data/extracted/')
        output_filename = os.path.join(output_dir, 'translated_' + os.path.basename(csv_filename))
        
        # Write the translated data to a new CSV file
        with open(output_filename, mode='w', newline='', encoding='utf-8') as output_file:
            writer = csv.DictWriter(output_file, fieldnames=reader.fieldnames + [name + "_id" for name in column_names])
            writer.writeheader()
            writer.writerows(rows)
        
        print("Translation completed. Output saved as:", output_filename)
    
    except Exception as e:
        print(f"An error occurred while processing the file: {e}")

def auto_translate(file_column_pairs):
    """
    Automatically translate multiple CSV files based on predefined column pairs.

    Args:
        file_column_pairs (dict): A dictionary where keys are CSV filenames 
                                  and values are lists of column names to translate.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    sql_keywords_filepath = os.path.join(script_dir, '../data/sql_keywords.txt')
    sql_keywords = load_sql_keywords(sql_keywords_filepath)

    for csv_filename, column_names in file_column_pairs.items():
        translate_and_save(csv_filename, column_names, sql_keywords)

if __name__ == "__main__":
    """
    Main function to either manually input CSV filename and column for translation,
    or automatically translate predefined files and columns.
    """
    choice = input("Choose an option (1: Manual Input, 2: Auto-Translate): ")
    
    if choice == '1':
        csv_filename = input("Enter the name of the CSV file (including .csv extension): ")
        column_name = input("Enter the name of the column to translate: ")
        translate_and_save(csv_filename, [column_name], load_sql_keywords('../data/sql_keywords.txt'))
    
    elif choice == '2':
        # It's recommended to comment out the file_column_pairs you don't want to translate first
        # before running the script to avoid timeouts.
        file_column_pairs = {
            # 'dev.csv': ['db_id', 'query_toks', 'question'],
            # 'train_others.csv': ['db_id', 'query_toks', 'question'],
            'train_spider.csv': ['db_id', 'query_toks', 'question'],
            # 'tables.csv': ['db_id','toks']
        }
        auto_translate(file_column_pairs)
    
    else:
        print("Invalid choice. Please enter 1 or 2.")
