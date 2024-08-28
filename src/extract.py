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
    unique_query_toks = set()  # Set to store unique (db_id, token) pairs
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
                    if (db_id, token) not in unique_query_toks:
                        if first_token:
                            writer.writerow([db_id, token, question])
                            first_token = False
                        else:
                            writer.writerow(['', token, ''])
                        unique_query_toks.add((db_id, token))

        print(f"Extraction completed. Output saved as: {output_csv}")

    except Exception as e:
        print(f"An error occurred: {e}")

def extract_tables(json_file, output_csv):
    """
    Extracts table names and column names from a JSON file and writes them to a CSV file.

    Parameters:
    - json_file: Path to the input JSON file containing the data.
    - output_csv: Path to the output CSV file where the extracted data will be saved.
    
    The output CSV file will contain two columns: 'db_id' and 'toks'.
    Each table name or column name will be written on a new line, with the 'db_id' field only filled in once per table.
    """
    unique_strings = set()  # Set to store unique (db_id, token) pairs
    try:
        with open(json_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(['db_id', 'toks'])  # Write the header row

            for table in data:
                db_id = table['db_id']  # Extract the database ID
                first_token = True  # Flag to check if it's the first token for this table

                # Extract and write column names
                for column_name in table['column_names']:
                    token = column_name[1]  # Extract the column name string
                    if (db_id, token) not in unique_strings:
                        if first_token:
                            writer.writerow([db_id, token])
                            first_token = False
                        else:
                            writer.writerow(['', token])
                        unique_strings.add((db_id, token))

                # Extract and write table names
                for table_name in table['table_names']:
                    if (db_id, table_name) not in unique_strings:
                        if first_token:
                            writer.writerow([db_id, table_name])
                            first_token = False
                        else:
                            writer.writerow(['', table_name])
                        unique_strings.add((db_id, table_name))

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
