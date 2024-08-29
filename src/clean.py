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
import pandas as pd

def clean_query_toks_id(query_toks_id):
    if isinstance(query_toks_id, str):
        # Replace whitespace with underscores
        query_toks_id = query_toks_id.replace(" ", "_")
        # Replace "name" with "nama"
        query_toks_id = query_toks_id.replace("name", "nama")
        # Remove trailing underscores
        query_toks_id = query_toks_id.rstrip("_")
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

def clean_column_names(column_names):
    if isinstance(column_names, str):
        column_names = column_names.lower().strip()
        # Check for "identitas" or "id" patterns
        if "identitas" in column_names:
            column_names = column_names.replace("identitas", "").strip()
            column_names = f"id {column_names}"
        elif "id" in column_names and column_names.split()[0] != "id":
            column_names = column_names.replace("id", "").strip()
            column_names = f"id {column_names}"
        # Remove trailing underscores
        column_names = column_names.rstrip("_")
        # Replace "name" with "nama"
        column_names = column_names.replace("name", "nama")
        
    return column_names

def clean_column_names_table(column_names_table):
    if isinstance(column_names_table, str):
        column_names_table = column_names_table.lower().strip()
        # Check for "identitas" or "id" patterns
        if "identitas" in column_names_table:
            column_names_table = column_names_table.replace("identitas", "").strip()
            column_names_table = f"id {column_names_table}"
        elif "id" in column_names_table and column_names_table.split()[0] != "id":
            column_names_table = column_names_table.replace("id", "").strip()
            column_names_table = f"id {column_names_table}"
        # Remove trailing underscores
        column_names_table = column_names_table.rstrip("_")
        # Replace "name" with "nama"
        column_names_table = column_names_table.replace("name", "nama")
        
    return column_names_table

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
    
    if "column_names" in df.columns:
        df["column_names"] = df["column_names"].apply(clean_column_names)
        
    if "column_names_table" in df.columns:
        df["column_names_table"] = df["column_names_table"].apply(clean_column_names_table)        
    
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

