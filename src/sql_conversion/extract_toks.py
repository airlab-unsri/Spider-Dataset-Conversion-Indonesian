import csv
import os

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

def extract_tokens(input_csv, sql_keywords, is_table_file=False):
    """
    Extract tokens from specific columns of the input CSV.

    Parameters:
        input_csv: Path to the input CSV file.
        sql_keywords: Set of SQL keywords to exclude from the tokens.
        is_table_file: Boolean indicating if the input file is for tables (with column and table names).
        
    Returns:
        set: A set of tuples containing extracted tokens and their corresponding ID translation.
    """
    tokens_set = set()  # Use a set to avoid duplicate tokens

    try:
        with open(input_csv, 'r', encoding='utf-8') as infile:
            reader = csv.DictReader(infile)

            for row in reader:
                db_id = row.get('db_id', '')
                db_id_id = row.get('db_id_id', '')  # ID translation for the database ID
                
                all_tokens = []

                if not is_table_file:
                    # Non-table CSV extraction
                    question = row.get('question', '')
                    question_id = row.get('question_id', '')
                    query_toks = row.get('query_toks', '')
                    query_toks_id = row.get('query_toks_id', '')
                    query_toks_no_value = row.get('query_toks_no_value', '')
                    query_toks_no_value_id = row.get('query_toks_no_value_id', '')
                    sql_string = row.get('sql_string', '')
                    sql_string_id = row.get('sql_string_id', '')

                    # Combine tokens and their corresponding ID translation
                    # all_tokens = list(zip(
                    #     query_toks if query_toks else [],
                    #     query_toks_id if query_toks_id else []
                    # )) + list(zip(
                    #     query_toks_no_value if query_toks_no_value else [],
                    #     query_toks_no_value_id if query_toks_no_value_id else []
                    # )) + list(zip(
                    #     sql_string if sql_string else [],
                    #     sql_string_id if sql_string_id else []
                    # )) + [(question, question_id)]
                    
                    all_tokens = [(
                        query_toks,
                        query_toks_id
                    )] + [(
                        query_toks_no_value,
                        query_toks_no_value_id
                    )] + [(
                        sql_string,
                        sql_string_id
                    )] + [(
                        question, 
                        question_id
                    )]

                else:
                    # Table CSV extraction (column names and table names)
                    column_names = row.get('column_names', '')
                    column_names_id = row.get('column_names_id', '')
                    column_names_original = row.get('column_names_original', '')
                    column_names_original_id = row.get('column_names_original_id', '')
                    table_names = row.get('table_names', '')
                    table_names_id = row.get('table_names_id', '')
                    table_names_original = row.get('table_names_original', '')
                    table_names_original_id = row.get('table_names_original_id', '')

                    all_tokens = [(
                        column_names,
                        column_names_id
                    )] + [(
                        column_names_original,
                        column_names_original_id
                    )] + [(
                        table_names,
                        table_names_id
                    )] + [(
                        table_names_original,
                        table_names_original_id
                    )]

                # Add db_id with its ID pair
                if db_id:
                    all_tokens += [(db_id, db_id_id)]
                
                # Filter out SQL keywords and retain only the valid tokens
                filtered_tokens = [(token, token_id) for token, token_id in all_tokens if token.lower() not in sql_keywords]

                # Update the set with the filtered tokens
                tokens_set.update(filtered_tokens)

        return tokens_set

    except Exception as e:
        print(f"An error occurred while processing {input_csv}: {e}")
        return set()


def process_files():
    """
    Process multiple input CSV files and extract tokens according to the defined logic.
    Merge the extracted data from all input files into a single CSV file.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the directory of the current script
    input_files = [
        'cleaned_translated_ext_dev.csv',
        'cleaned_translated_ext_train_others.csv',
        'cleaned_translated_ext_train_spider.csv',
        'cleaned_translated_tables.csv'
    ]
    
    input_dir = os.path.join(script_dir, '../../data/extracted/')
    output_path = os.path.join(script_dir, '../../data/tokens/tokens_json.csv')  # Single output file
    
    # Ensure the output directory exists
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    sql_keywords = load_sql_keywords(os.path.join(script_dir, '../../data/sql_keywords.txt'))

    # Set to store all tokens (no duplicates)
    all_tokens = set()

    # Process each input file and accumulate the tokens
    for input_file in input_files:
        input_path = os.path.join(input_dir, input_file)

        # Check if the file is related to tables
        is_table_file = input_file == 'cleaned_translated_tables.csv'

        # Extract tokens from the current file and merge with all_tokens
        tokens = extract_tokens(input_path, sql_keywords, is_table_file)
        all_tokens.update(tokens)

    # Write the merged tokens to the output CSV file
    try:
        with open(output_path, 'w', newline='', encoding='utf-8') as outfile:
            fieldnames = ['toks', 'toks_id']
            writer = csv.DictWriter(outfile, fieldnames=fieldnames)
            writer.writeheader()

            for token, token_id in all_tokens:
                writer.writerow({
                    'toks': token,
                    'toks_id': token_id,
                })

        print(f"Merged tokens extraction completed. Output saved as: {output_path}")

    except Exception as e:
        print(f"An error occurred while writing to {output_path}: {e}")

if __name__ == "__main__":
    process_files()
