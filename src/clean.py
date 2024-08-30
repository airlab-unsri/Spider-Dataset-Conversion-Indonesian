"""
Cleaning translated_train_spider.csv, translated_train_others.csv, translated_dev and translated_tables.csv

TODO:
Cleaning task:

- translated_train_spider.csv, translated_train_others.csv, translated_dev_csv:
1. IF query_toks_id contain whitespace, replace with underscore "_"
2. Change "name" to "nama" in query_toks_id
3. Remove trailing underscore in query_toks_id and db_id_id
4. For db_id_id, if contain whitespace, replace with underscore "_"

- translated_tables.csv
1. For db_id_id, if contain whitespace, replace with underscore "_"
2. Remove trailing underscore in db_id_id and toks_id
3. For toks_id, each "{word} identitas" or "{word} id" change to "id {word}" (not case sensitive)
4. Make lowercase for all db_id_id and toks_id

Remember to use absolute path.
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filepath = os.path.join(script_dir, '../data/extracted/', csv_filename)

Generate new file:
cleaned_{file_name}.csv
"""

import os
import re
import pandas as pd

def transform_id_patterns(text):
    # Handle {word}.{word}_ID or {word}.{word}_id
    text = re.sub(r'(\w+)\.(\w+?)_(ID|id)', r'\1.ID_\2', text)
    
    # Handle {word}_ID or {word}_id
    text = re.sub(r'(\w+?)_(ID|id)', r'ID_\1', text)

    return text

def clean_query_toks_id(query_toks_id):
    if isinstance(query_toks_id, str):
        # Replace whitespace with underscores
        query_toks_id = query_toks_id.replace(" ", "_")
        # Replace "name" with "nama"
        query_toks_id = query_toks_id.replace("name", "nama")
        # Remove trailing underscores
        query_toks_id = query_toks_id.rstrip("_")
        # Transform ID patterns
        query_toks_id = transform_id_patterns(query_toks_id)
    return query_toks_id

def clean_db_id_id(db_id_id):
    if isinstance(db_id_id, str):
        # Replace whitespace with underscores
        db_id_id = db_id_id.replace(" ", "_")
        # Remove trailing underscores
        db_id_id = db_id_id.rstrip("_")
    return db_id_id

def clean_toks_id(toks_id):
    if isinstance(toks_id, str):
        toks_id = toks_id.lower().strip()
        # Check for "identitas" or "id" patterns
        if "identitas" in toks_id:
            toks_id = toks_id.replace("identitas", "").strip()
            toks_id = f"id {toks_id}"
        elif "id" in toks_id and toks_id.split()[0] != "id":
            toks_id = toks_id.replace("id", "").strip()
            toks_id = f"id {toks_id}"
        # Remove trailing underscores
        toks_id = toks_id.rstrip("_")
        # Replace "name" with "nama"
        toks_id = toks_id.replace("name", "nama")
        
    return toks_id

def clean_column_names_id(column_names_id):
    if isinstance(column_names_id, str):
        column_names_id = column_names_id.lower().strip()
        # Check for "identitas" or "id" patterns
        if "identitas" in column_names_id:
            column_names_id = column_names_id.replace("identitas", "").strip()
            column_names_id = f"id {column_names_id}"
        elif "id" in column_names_id and column_names_id.split()[0] != "id":
            column_names_id = column_names_id.replace("id", "").strip()
            column_names_id = f"id {column_names_id}"
        # Remove trailing underscores
        column_names_id = column_names_id.rstrip("_")
        # Replace whitespaces with underscores
        column_names_id = column_names_id.replace(" ", "_")
        # Replace double underscores with underscores
        column_names_id = column_names_id.replace("__", "_")
        # Transform ID patterns
        column_names_id = transform_id_patterns(column_names_id)
        
    return column_names_id

def clean_column_names_original_id(column_names_original_id):
    if isinstance(column_names_original_id, str):
        column_names_original_id = column_names_original_id.lower().strip()
        # Check for "identitas" or "id" patterns
        if "identitas" in column_names_original_id:
            column_names_original_id = column_names_original_id.replace("identitas", "").strip()
            column_names_original_id = f"id {column_names_original_id}"
        elif "id" in column_names_original_id and column_names_original_id.split()[0] != "id":
            column_names_original_id = column_names_original_id.replace("id", "").strip()
            column_names_original_id = f"id {column_names_original_id}"
        # Remove trailing underscores
        column_names_original_id = column_names_original_id.rstrip("_")
        # Replace whitespaces with underscores
        column_names_original_id = column_names_original_id.replace(" ", "_")
        # Replace double underscores with underscores
        column_names_original_id = column_names_original_id.replace("__", "_")
        # Transform ID patterns
        column_names_original_id = transform_id_patterns(column_names_original_id)
        
    return column_names_original_id

def clean_csv(csv_filename):
    script_dir = os.path.dirname(os.path.abspath(__file__))
    csv_filepath = os.path.join(script_dir, '../data/extracted/', csv_filename)
    
    # Read the CSV file
    df = pd.read_csv(csv_filepath)
    
    if "query_toks_id" in df.columns:
        df["query_toks_id"] = df["query_toks_id"].apply(clean_query_toks_id)
    
    if "db_id_id" in df.columns:
        df["db_id_id"] = df["db_id_id"].apply(clean_db_id_id)
    
    if "toks_id" in df.columns:
        df["toks_id"] = df["toks_id"].apply(clean_toks_id)
    
    if "column_names_id" in df.columns:
        df["column_names_id"] = df["column_names_id"].apply(clean_column_names_id)
        
    if "column_names_original_id" in df.columns:
        df["column_names_original_id"] = df["column_names_original_id"].apply(clean_column_names_original_id)        
    
    # Generate cleaned CSV file
    cleaned_csv_filename = f"cleaned_{csv_filename}"
    cleaned_csv_filepath = os.path.join(script_dir, '../data/extracted/', cleaned_csv_filename)
    df.to_csv(cleaned_csv_filepath, index=False)
    print(f"Saved cleaned file to {cleaned_csv_filepath}")

if __name__ == "__main__":
    # Files to clean
    files_to_clean = [
        "translated_train_spider.csv",
        "translated_train_others.csv",
        "translated_dev.csv",
        "translated_tables.csv"
    ]
    
    for file_name in files_to_clean:
        clean_csv(file_name)