import os
import json
import csv
import re

# Set up paths for input and output files
script_dir = os.path.dirname(os.path.abspath(__file__))
input_paths = {
    'tables.json': '../data/extracted/cleaned_translated_tables.csv',
    'dev.json': '../data/extracted/cleaned_translated_ext_dev.csv',
    'train_others.json': '../data/extracted/cleaned_translated_ext_train_others.csv',
    'train_spider.json': '../data/extracted/cleaned_translated_ext_train_spider.csv'
}
output_dir = os.path.join(script_dir, '../data/converted/spider/')
os.makedirs(output_dir, exist_ok=True)

def load_translation_mappings_table(csv_path):
    """
    Load table translation mappings from a CSV file.

    Parameters:
        csv_path (str): Path to the CSV file containing table translations.

    Returns:
        dict: A dictionary mapping normalized names to their translations for tables and columns.
    """
    translation_map = {
        'db_id': {},
        'table_names': {},
        'table_names_original': {},
        'column_names': {}, 
        'column_names_original': {}
    }
    with open(csv_path, mode='r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            # Normalize and map CSV values
            db_id = normalize_name(row['db_id'])
            column_name = normalize_name(row['column_names'])
            column_name_original = normalize_name(row['column_names_original'])
            table_name = normalize_name(row['table_names'])
            table_name_original = normalize_name(row['table_names_original'])
            db_id_translation = row['db_id_id'].strip()
            column_name_translation = row['column_names_id'].strip()
            column_name_original_translation = row['column_names_original_id'].strip()
            table_name_translation = row['table_names_id'].strip()
            table_name_original_translation = row['table_names_original_id'].strip()

            # Add to translation map
            if db_id:
                translation_map['db_id'][db_id] = db_id_translation
            if column_name:
                translation_map['column_names'][column_name] = column_name_translation
            if column_name_original:
                translation_map['column_names_original'][column_name_original] = column_name_original_translation
            if table_name:
                translation_map['table_names'][table_name] = table_name_translation
            if table_name_original:
                translation_map['table_names_original'][table_name_original] = table_name_original_translation

    print("Loaded table translation map:", translation_map['db_id'])
    return translation_map

def load_translation_mappings_train_dev(csv_path):
    """
    Load translation mappings for queries and questions from a CSV file for training and development.

    Parameters:
        csv_path (str): Path to the CSV file containing query and question translations.

    Returns:
        dict: A dictionary mapping normalized names, query tokens, and questions to their translations.
    """
    translation_map = {
        'db_id': {},
        'query_toks': {},
        'query_toks_no_value': {},
        'question': {},
        'sql_string': {}
    }
    with open(csv_path, mode='r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            db_id = normalize_name(row['db_id'])
            query_toks = row['query_toks'].strip()
            query_toks_no_value = row['query_toks_no_value'].strip()
            question = row['question'].strip()
            sql_string = row['sql_string'].strip()

            db_id_translation = row['db_id_id'].strip()
            query_toks_translation = row['query_toks_id'].strip()
            query_toks_no_value_translation = row['query_toks_no_value_id'].strip()
            question_translation = row['question_id'].strip()
            sql_string_translation = row['sql_string_id'].strip()

            if db_id:
                translation_map['db_id'][db_id] = db_id_translation
            if query_toks:
                translation_map['query_toks'][query_toks] = query_toks_translation
            if query_toks_no_value:
                translation_map['query_toks_no_value'][query_toks_no_value] = query_toks_no_value_translation
            if question:
                translation_map['question'][question] = question_translation
            if sql_string:
                translation_map['sql_string'][sql_string] = sql_string_translation

    print("Loaded train/dev translation map:", translation_map['db_id'])
    return translation_map

def normalize_name(name):
    """
    Normalize a name by stripping whitespace, replacing underscores with spaces, and converting to lowercase.

    Parameters:
        name (str): The name to normalize.

    Returns:
        str: The normalized name.
    """
    return name.strip().replace('_', ' ').lower()

def tokenize_string(s):
    """
    Tokenize a string by splitting on non-alphanumeric characters.

    Parameters:
        s (str): The string to tokenize.

    Returns:
        list: A list of tokens split by non-alphanumeric characters.
    """
    return re.findall(r"[A-Za-z0-9_]+|[^A-Za-z0-9_]", s)

def tokenize_without_spaces(s):
    """
    Tokenize a string without including spaces, focusing on specific punctuation.

    Parameters:
        s (str): The string to tokenize.

    Returns:
        list: A list of tokens split by alphanumeric characters and specific punctuation.
    """
    return re.findall(r"[A-Za-z0-9_]+|[.,?()]", s)

def normalize_query_string(query):
    """
    Normalize a query string by removing extra spaces around dots and ensuring single spaces between tokens.

    Parameters:
        query (str): The query string to normalize.

    Returns:
        str: The normalized query string.
    """
    # Remove spaces around dots
    query = re.sub(r'\s*\.\s*', '.', query)
    # Ensure single spaces between other tokens
    return " ".join(query.split())

def generate_query_toks_no_value(tokens):
    new_tokens = []
    i = 0
    while i < len(tokens):
        token = tokens[i]
        
        # Match patterns like "'something'", "something'", "`something`", etc.
        if re.match(r"^(['\"`])[^'\"]+\1$", token):
            new_tokens.append("value")
        
        # Match patterns like "'word", "middle", "word'"
        elif (
            i < len(tokens) - 2 and 
            ((tokens[i].startswith("'") or tokens[i].startswith("`")) and tokens[i+2] == tokens[i][0])
        ):
            new_tokens.append("value")
            i += 2  # Skip the next two tokens since they form the matched pattern

        # Match patterns like "'", "middle", "another'", "last'"
        elif (
            token in ["'", "`"] and 
            i < len(tokens) - 2 and 
            tokens[i+2] in ["'", "`"]
        ):
            new_tokens.append("value")
            i += 2  # Skip the next two tokens
        
        # Match patterns like standalone numbers or floating point values
        elif re.match(r"^\d+(\.\d+)?$", token):  # Matches numerical values
            new_tokens.append("value")
        
        # Handle other cases (non-values)
        else:
            new_tokens.append(token)
        
        i += 1

    return new_tokens

def load_json_file(json_path):
    """
    Load JSON data from a file.

    Parameters:
        json_path (str): Path to the JSON file.

    Returns:
        dict: The loaded JSON data.
    """
    with open(json_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def extract_sql_strings(sql):
    extracted_strings = []
    
    def recursive_extract(obj):
        if isinstance(obj, str):
            if re.match(r'^"[^"]*"$', obj):  # Match strings enclosed in double quotes
                extracted_strings.append(obj)
        elif isinstance(obj, list):
            for item in obj:
                recursive_extract(item)
        elif isinstance(obj, dict):
            for key, value in obj.items():
                recursive_extract(value)
                
    recursive_extract(sql)
    # print("Extracted SQL strings:", extracted_strings)  # Debugging line
    return extracted_strings

def extract_and_replace_sql_strings(sql, translation_map):
    def recursive_extract_and_replace(obj):
        if isinstance(obj, str):
            if re.match(r'^"[^"]*"$', obj):  # Match strings enclosed in double quotes
                extracted_string = obj
                translated_string = translation_map['sql_string'].get(extracted_string, extracted_string)
                if extracted_string != translated_string:
                    print(f"Replacing '{extracted_string}' with '{translated_string}'")
                return translated_string
            else:
                return obj
        elif isinstance(obj, list):
            return [recursive_extract_and_replace(item) for item in obj]
        elif isinstance(obj, dict):
            return {key: recursive_extract_and_replace(value) for key, value in obj.items()}
        else:
            return obj

    return recursive_extract_and_replace(sql)


def replace_values_in_json(data, translation_map, is_table=False):
    """
    Replace values in JSON data based on a translation map.

    Parameters:
        data (list): List of JSON objects to process.
        translation_map (dict): Dictionary mapping original values to translations.
        is_table (bool): Flag indicating if processing table data (True) or query data (False).

    Returns:
        None: Modifies the data in place.
    """
    for item in data:
        if is_table:
            # Replace table-specific fields
            db_id = normalize_name(item['db_id'])
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace in column_names
            for i, (index, name) in enumerate(item['column_names']):
                clean_name = normalize_name(name)
                item['column_names'][i][1] = translation_map['column_names'].get(clean_name, name)

            # Replace in column_names_original
            for i, (index, name) in enumerate(item['column_names_original']):
                clean_name = normalize_name(name)
                item['column_names_original'][i][1] = translation_map['column_names_original'].get(clean_name, name)

            # Replace in table_names
            for i, name in enumerate(item['table_names']):
                clean_name = normalize_name(name)
                item['table_names'][i] = translation_map['table_names'].get(clean_name, name)

            # Replace in table_names_original
            for i, name in enumerate(item['table_names_original']):
                clean_name = normalize_name(name)
                item['table_names_original'][i] = translation_map['table_names_original'].get(clean_name, name)
        else:
            # Replace in dev, train_others, and train_spider files
            db_id = normalize_name(item['db_id'])
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace query_toks
            item['query_toks'] = [translation_map['query_toks'].get(tok, tok) for tok in item['query_toks']]

            # Normalize and replace query ensuring single spacing
            item['query'] = normalize_query_string(
                " ".join([translation_map['query_toks'].get(tok, tok) for tok in tokenize_string(item['query'])])
            )

            # Generate and replace query_toks_no_value
            # item['query_toks_no_value'] = generate_query_toks_no_value(item['query_toks'], item['query_toks_no_value'])
            item['query_toks_no_value'] = [translation_map['query_toks_no_value'].get(tok, tok) for tok in item['query_toks_no_value']]

            # Replace question
            item['question'] = translation_map['question'].get(item['question'], item['question'])

            # Replace question_toks without spaces
            item['question_toks'] = tokenize_without_spaces(item['question'])
            
            # Replace SQL string based on sql_string_id
            if 'sql' in item:
                item['sql'] = extract_and_replace_sql_strings(item['sql'], translation_map)
                    

def save_json_file(data, output_path):
    """
    Save JSON data to a file.

    Parameters:
        data (dict): The JSON data to save.
        output_path (str): Path to the output file.

    Returns:
        None
    """
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    print("Saved " + output_path)

def main():
    """
    Main process function to load, translate, and save JSON files.
    """
    # Translate tables.json
    json_data = load_json_file(os.path.join(script_dir, '../data/spider/tables.json'))
    translation_map = load_translation_mappings_table(os.path.join(script_dir, input_paths['tables.json']))
    replace_values_in_json(json_data, translation_map, is_table=True)
    save_json_file(json_data, os.path.join(output_dir, 'tables.json'))

    # Translate dev.json, train_others.json, train_spider.json
    for file_name in ['dev.json', 'train_others.json', 'train_spider.json']:
        json_data = load_json_file(os.path.join(script_dir, f'../data/spider/{file_name}'))
        translation_map = load_translation_mappings_train_dev(os.path.join(script_dir, input_paths[file_name]))
        replace_values_in_json(json_data, translation_map, is_table=False)
        save_json_file(json_data, os.path.join(output_dir, file_name))

if __name__ == '__main__':
    main()
