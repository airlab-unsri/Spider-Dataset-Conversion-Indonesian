import csv
import os
from googletrans import Translator

def translate_column(csv_filename, column_name):
    # Initialize translator
    translator = Translator()
    
    # Get the absolute path of the current script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filename = os.path.join(script_dir, '../data/extracted/', csv_filename)
    
    # Check if file exists
    if not os.path.isfile(csv_filename):
        print(f"Error: File '{csv_filename}' does not exist.")
        return
    
    # Try to open and process the CSV file
    try:
        with open(csv_filename, mode='r', encoding='utf-8') as csv_file:
            reader = csv.DictReader(csv_file)
            rows = list(reader)
            if column_name not in reader.fieldnames:
                print(f"Error: Column '{column_name}' not found in the file.")
                return
            
            # Translate the specified column
            for row in rows:
                try:
                    row[column_name + "_id"] = translator.translate(row[column_name], src='en', dest='id').text
                except Exception as e:
                    print(f"Error translating row: {row[column_name]}. Error: {e}")
                    return

        # Write the results back to a new CSV file
        output_dir = os.path.join(script_dir, '../data/extracted/')
        output_filename = os.path.join(output_dir, 'translated_' + os.path.basename(csv_filename))

        with open(output_filename, mode='w', newline='', encoding='utf-8') as output_file:
            writer = csv.DictWriter(output_file, fieldnames=reader.fieldnames + [column_name + "_id"])
            writer.writeheader()
            writer.writerows(rows)
        
        print("Translation completed. Output saved as:", output_filename)
    
    except Exception as e:
        print(f"An error occurred while processing the file: {e}")

def auto_translate(file_column_pairs):
    for csv_filename, column_names in file_column_pairs.items():
        for column_name in column_names:
            translate_column(csv_filename, column_name)

if __name__ == "__main__":
    choice = input("Choose an option (1: Manual Input, 2: Auto-Translate): ")
    
    if choice == '1':
        csv_filename = input("Enter the name of the CSV file (including .csv extension): ")
        column_name = input("Enter the name of the column to translate: ")
        translate_column(csv_filename, column_name)
    
    elif choice == '2':
        file_column_pairs = {
            'dev.csv': ['db_id', 'query', 'question'],
            'train_others.csv': ['db_id', 'query', 'question'],
            'train_spider.csv': ['db_id', 'query', 'question'],
            'tables.csv': ['column_names', 'column_names_original', 'db_id', 'table_names', 'table_names_original']
        }
        auto_translate(file_column_pairs)
    
    else:
        print("Invalid choice. Please enter 1 or 2.")
