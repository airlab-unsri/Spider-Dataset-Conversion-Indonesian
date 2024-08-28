import csv
import os
import re
import time
from googletrans import Translator
import concurrent.futures
from math import ceil

def load_sql_keywords(filepath):
    """
    Load SQL keywords from a file into a set.

    Parameters:
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

    Parameters:
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

    Parameters:
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

    Parameters:
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

def split_csv(csv_filename, num_splits=5):
    """
    Split the CSV file into multiple parts.
    
    Parameters:
        csv_filename (str): The name of the CSV file to split.
        num_splits (int): Number of parts to split into.
        
    Returns:
        list: List of filenames for the split CSVs.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filepath = os.path.join(script_dir, '../data/extracted/', csv_filename)
    
    if not os.path.isfile(csv_filepath):
        print(f"Error: File '{csv_filepath}' does not exist.")
        return []
    
    try:
        with open(csv_filepath, mode='r', encoding='utf-8') as csv_file:
            reader = list(csv.DictReader(csv_file))
            total_rows = len(reader)
            rows_per_split = ceil(total_rows / num_splits)
            split_filenames = []
            
            base_filename = os.path.splitext(csv_filename)[0]
            
            for i in range(num_splits):
                split_filename = f'{base_filename}_{i+1}.csv'
                split_filepath = os.path.join(script_dir, '../data/extracted/', split_filename)
                
                with open(split_filepath, mode='w', newline='', encoding='utf-8') as split_file:
                    writer = csv.DictWriter(split_file, fieldnames=reader[0].keys())
                    writer.writeheader()
                    writer.writerows(reader[i * rows_per_split: (i + 1) * rows_per_split])
                
                split_filenames.append(split_filepath)
        
        return split_filenames
    
    except Exception as e:
        print(f"An error occurred while splitting the file: {e}")
        return []

def merge_csvs(split_filenames, output_filename):
    """
    Merge multiple CSV files into one.
    
    Parameters:
        split_filenames (list): List of CSV filenames to merge.
        output_filename (str): The name of the output merged CSV file.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_filepath = os.path.join(script_dir, '../data/extracted/', output_filename)
    
    try:
        with open(output_filepath, mode='w', newline='', encoding='utf-8') as output_file:
            writer = None
            
            for split_filepath in split_filenames:
                split_filepath = os.path.join(script_dir, '../data/extracted/', split_filepath)
                with open(split_filepath, mode='r', encoding='utf-8') as split_file:
                    reader = csv.DictReader(split_file)
                    
                    if writer is None:
                        writer = csv.DictWriter(output_file, fieldnames=reader.fieldnames)
                        writer.writeheader()
                    
                    for row in reader:
                        writer.writerow(row)
        
        print(f"Merge completed. Output saved as: {output_filepath}")
    
    except Exception as e:
        print(f"An error occurred while merging files: {e}")

def translate_and_save(csv_filename, column_names, sql_keywords=None):
    """
    Translate specified columns in a CSV file and save the result.

    Parameters:
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
        
        print("Waiting for 60 seconds to avoid Google Translate API rate limits...")
        time.sleep(60)  # Wait for 60 seconds to avoid Google Translate API rate limits
    
    except Exception as e:
        print(f"An error occurred while processing the file: {e}")

def auto_translate(file_column_pairs):
    """
    Automatically translate multiple CSV files based on predefined column pairs.

    Parameters:
        file_column_pairs (dict): A dictionary where keys are CSV filenames 
                                  and values are lists of column names to translate.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    sql_keywords_filepath = os.path.join(script_dir, '../data/sql_keywords.txt')
    sql_keywords = load_sql_keywords(sql_keywords_filepath)

    for csv_filename, column_names in file_column_pairs.items():
        if csv_filename == 'train_spider.csv':
            split_filenames = split_csv(csv_filename)
            translated_filenames = []

            for split_filename in split_filenames:
                translate_and_save(os.path.basename(split_filename), column_names, sql_keywords)
                translated_filenames.append(f'translated_{os.path.basename(split_filename)}')

            merge_csvs(translated_filenames, 'translated_train_spider.csv')
        
        elif csv_filename == 'tables.csv':
            split_filenames = split_csv(csv_filename, num_splits=3)
            translated_filenames = []

            for split_filename in split_filenames:
                translate_and_save(os.path.basename(split_filename), column_names, sql_keywords)
                translated_filenames.append(f'translated_{os.path.basename(split_filename)}')

            merge_csvs(translated_filenames, 'translated_tables.csv')
            
        elif csv_filename == 'tables_3.csv':
            translated_filenames = [f'translated_tables_{i}.csv' for i in range(1, 4)]

            merge_csvs(translated_filenames, 'translated_tables.csv')
        
        elif csv_filename == 'train_spider_5.csv':
            # translated_filenames = [
            #     'translated_train_spider_1.csv',
            #     'translated_train_spider_2.csv',
            #     'translated_train_spider_3.csv',
            #     'translated_train_spider_4.csv',
            #     'translated_train_spider_5.csv',
            # ]
            
            translated_filenames = [f'translated_train_spider_{i}.csv' for i in range(1, 6)]
            
            translate_and_save(csv_filename, column_names, sql_keywords)
            merge_csvs(translated_filenames, 'translated_train_spider.csv')
            
        elif csv_filename == 'train_spider_6.csv':
            # Damn Google Translate API rate limits...
            translated_filenames = [f'translated_train_spider_{i}.csv' for i in range(1, 6)]
            
            merge_csvs(translated_filenames, 'translated_train_spider.csv')
            
        
        else:
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
            # 'train_spider.csv': ['db_id', 'query_toks', 'question'],
            # 'tables.csv': ['db_id','toks']
            'tables_3.csv': ['db_id', 'toks'],
            # 'train_spider_1.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider_2.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider_3.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider_4.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider_5.csv': ['db_id', 'query_toks', 'question'],
            # 'train_spider_6.csv': ['db_id', 'query_toks', 'question'],

        }
        auto_translate(file_column_pairs)
    
    else:
        print("Invalid choice. Please enter 1 or 2.")
