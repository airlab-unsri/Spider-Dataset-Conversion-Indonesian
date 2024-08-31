import json
import os
import csv
import re

def extract_query_toks_and_question(json_file, output_csv):
    """
    Extracts query tokens, query tokens with no values, and corresponding questions from a JSON file 
    and writes them to a CSV file. Also extracts strings inside SQL that match the pattern "(.*?)" or \\"(.*?)\\".

    Parameters:
    - json_file: Path to the input JSON file containing the data.
    - output_csv: Path to the output CSV file where the extracted data will be saved.
    
    The output CSV file will contain five columns: 'db_id', 'query_toks', 'query_toks_no_value', 'question', 'sql_string'.
    Each value will be written in its own column, with empty rows as necessary to align with the longest column.
    """
    try:
        with open(json_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(['db_id', 'question', 'query_toks', 'query_toks_no_value', 'sql_string'])  # Write the header row

            for item in data:
                db_id = item['db_id']  # Extract the database ID
                question = item.get('question', '')  # Extract the question (if exists)
                sql_strings = extract_sql_strings(item.get('sql', {}))  # Extract SQL strings

                query_toks = item.get('query_toks', [])
                query_toks_no_value = item.get('query_toks_no_value', [])
                
                max_rows = max(len(query_toks), len(query_toks_no_value), len(sql_strings))
                
                for i in range(max_rows):
                    row = []
                    if i == 0:
                        row.append(db_id)  # Add db_id only for the first row
                        row.append(question)  # Add question only for the first row
                    else:
                        row.extend(['', ''])  # Leave db_id and question columns empty after the first row
                    
                    row.append(query_toks[i] if i < len(query_toks) else '')
                    row.append(query_toks_no_value[i] if i < len(query_toks_no_value) else '')
                    row.append(sql_strings[i] if i < len(sql_strings) else '')

                    writer.writerow(row)

        print(f"Extraction completed. Output saved as: {output_csv}")

    except Exception as e:
        print(f"An error occurred: {e}")

def extract_sql_strings(sql):
    """
    Recursively extract strings inside SQL that match the pattern "(.*?)" or \\"(.*?)\\".

    Parameters:
    - sql: The SQL object from which to extract strings.

    Returns:
    - A list of extracted SQL strings, each on a new row.
    """
    extracted_strings = []
    
    def recursive_extract(obj):
        if isinstance(obj, str):
            # Match strings with double quotes at the start and end
            if re.match(r'^".*"$', obj) or re.match(r'^\\".*\\"$', obj):
                extracted_strings.append(obj)  # Preserve the quotes around the string
        elif isinstance(obj, list):
            for item in obj:
                recursive_extract(item)
        elif isinstance(obj, dict):
            for key, value in obj.items():
                recursive_extract(value)


    recursive_extract(sql)
    return extracted_strings


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
