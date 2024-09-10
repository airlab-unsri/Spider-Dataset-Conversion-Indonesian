import os
import re
import pandas as pd

def replace_hyphen_with_underscore(value):
    """
    Replace hyphens with underscores in a string, only for words, not single characters or numbers.

    Parameters:
        value (str): The string value to process.

    Returns:
        str: The modified string with hyphens replaced by underscores for words only.
              If the input is not a string, the original value is returned unchanged.
    """    
    if isinstance(value, str):
        if value.lower() == 'e-mail':
            return value.replace('-', '')
        else:
            # Use regex to replace hyphen between alphabetic characters only
            return re.sub(r'(?<=[a-zA-Z])-(?=[a-zA-Z])', '_', value)
    return value

def clean_table_csv(csv_filepath):
    """
    Clean the table CSV file by replacing hyphens with underscores in columns ending with `_id`.

    Parameters:
        csv_filepath (str): The file path to the CSV file to clean.

    Returns:
        None: Saves the modified CSV file back to the same file location.
    """
    df = pd.read_csv(csv_filepath)

    # Replace hyphens with underscores in all `{name}_id` columns
    for col in df.columns:
        if col.endswith('_id'):
            df[col] = df[col].apply(replace_hyphen_with_underscore)
    
    # Save changes back to the same file
    df.to_csv(csv_filepath, index=False)
    print(f"Updated file: {csv_filepath}")

def clean_query_csv(csv_filepath):
    """
    Clean the query CSV file by replacing hyphens with underscores in specific columns.

    Columns affected:
        - `query_toks_id`
        - `query_toks_no_value_id`

    Parameters:
        csv_filepath (str): The file path to the query CSV file to clean.

    Returns:
        None: Saves the modified CSV file back to the same file location.
    """
    df = pd.read_csv(csv_filepath)

    # Replace hyphens with underscores in `query_toks_id` and `query_toks_no_value_id` columns
    if "query_toks_id" in df.columns:
        df["query_toks_id"] = df["query_toks_id"].apply(replace_hyphen_with_underscore)
    if "query_toks_no_value_id" in df.columns:
        df["query_toks_no_value_id"] = df["query_toks_no_value_id"].apply(replace_hyphen_with_underscore)
    
    # Save changes back to the same file
    df.to_csv(csv_filepath, index=False)
    print(f"Updated file: {csv_filepath}")

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Files to clean
    table_files = [
        "cleaned_translated_tables.csv",
    ]
    
    query_files = [
        "cleaned_translated_ext_train_spider.csv",
        "cleaned_translated_ext_train_others.csv",
        "cleaned_translated_ext_dev.csv",
    ]
    
    for file_name in table_files:
        csv_filepath = os.path.join(script_dir, '../data/extracted/', file_name)
        clean_table_csv(csv_filepath)

    for file_name in query_files:
        csv_filepath = os.path.join(script_dir, '../data/extracted/', file_name)
        clean_query_csv(csv_filepath)
