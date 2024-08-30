import json
import os
import csv

def extract_query_toks_and_question(json_file, output_csv):
    """
    Extracts query tokens and corresponding questions from a JSON file and writes them to a CSV file.

    Parameters:
    - json_file: Path to the input JSON file containing the data.
    - output_csv: Path to the output CSV file where the extracted data will be saved.
    
    The output CSV file will contain three columns: 'db_id', 'query_toks', and 'question'.
    Each query token will be written on a new line, with the 'db_id' and 'question' fields only filled in once per query.
    """
    try:
        with open(json_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(['db_id', 'query_toks', 'question'])  # Write the header row

            for item in data:
                db_id = item['db_id']  # Extract the database ID
                question = item.get('question', '')  # Extract the question (if exists)

                first_token = True  # Flag to check if it's the first token in the query
                for token in item['query_toks']:
                    if first_token:
                        writer.writerow([db_id, token, question])
                        first_token = False
                    else:
                        writer.writerow(['', token, ''])

        print(f"Extraction completed. Output saved as: {output_csv}")

    except Exception as e:
        print(f"An error occurred: {e}")

def extract_tables(json_file, output_csv):
    """
    Extracts table names and column names from a JSON file and writes them to a CSV file.

    Parameters:
    - json_file: Path to the input JSON file containing the data.
    - output_csv: Path to the output CSV file where the extracted data will be saved.
    
    The output CSV file will contain three columns: 'db_id', 'column_names', 'column_names_original', 'table_names', 'table_names_original'.
    """
    unique_strings = set()  # Set to store unique (db_id, token) pairs
    
    try:
        with open(json_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(['db_id', 'column_names', 'column_names_original', 'table_names', 'table_names_original'])  # Write the header row

            for table in data:
                db_id = table['db_id']  # Extract the database ID
                
                # Extract and write column names and table names together
                max_len = max(len(table['column_names']), len(table['table_names']))
                
                for i in range(max_len):
                    if i < len(table['column_names']):
                        column_name = table['column_names'][i][1]
                        column_name_original = table['column_names_original'][i][1]
                    else:
                        column_name = ''
                        column_name_original = ''

                    if i < len(table['table_names']):
                        table_name = table['table_names'][i]
                        table_name_original = table['table_names_original'][i]
                    else:
                        table_name = ''
                        table_name_original = ''

                    # Write row with db_id for the first row, then empty for subsequent rows
                    if i == 0:
                        writer.writerow([db_id, column_name, column_name_original, table_name, table_name_original])
                    else:
                        writer.writerow(['', column_name, column_name_original, table_name, table_name_original])

        print(f"Extraction completed. Output saved as: {output_csv}")

    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    """
    Main function to manage the extraction process for multiple JSON files.
    It defines input and output paths and ensures the output directory exists.
    The function calls specific extraction functions based on the input JSON files.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the directory of the current script
    
    # Define a dictionary of input JSON files and corresponding output CSV files
    input_files = {
        'dev.json': 'dev.csv',
        'train_others.json': 'train_others.csv',
        'train_spider.json': 'train_spider.csv',
        'tables.json': 'tables.csv'
    }
    
    input_dir = os.path.join(script_dir, '../data/spider/')  # Directory containing the input JSON files
    output_dir = os.path.join(script_dir, '../data/extracted/')  # Directory to save the output CSV files

    # Ensure the output directory exists, create it if not
    os.makedirs(output_dir, exist_ok=True)

    # Iterate through the input files and process them
    for json_filename, csv_filename in input_files.items():
        json_path = os.path.join(input_dir, json_filename)
        csv_path = os.path.join(output_dir, csv_filename)

        if json_filename == 'tables.json':
            extract_tables(json_path, csv_path)
        else:
            extract_query_toks_and_question(json_path, csv_path)

if __name__ == "__main__":
    main()
