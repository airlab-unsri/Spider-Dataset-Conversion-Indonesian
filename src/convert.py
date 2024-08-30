import os
import json
import csv

# Set up paths
script_dir = os.path.dirname(os.path.abspath(__file__))
input_paths = {
    'tables.json': '../data/extracted/cleaned_translated_tables.csv',
    'dev.json': '../data/extracted/cleaned_translated_dev.csv',
    'train_others.json': '../data/extracted/cleaned_translated_train_others.csv',
    'train_spider.json': '../data/extracted/cleaned_translated_train_spider.csv'
}
output_dir = os.path.join(script_dir, '../data/converted/spider/')
os.makedirs(output_dir, exist_ok=True)

# Load translation mappings from CSV
def load_translation_mappings_table(csv_path):
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
                translation_map['db_id'][db_id] = db_id_translation  # Correctly populate the db_id map
            if column_name:
                translation_map['column_names'][column_name] = column_name_translation
            if column_name_original:
                translation_map['column_names_original'][column_name_original] = column_name_original_translation
            if table_name:
                translation_map['table_names'][table_name] = table_name_translation
            if table_name_original:
                translation_map['table_names_original'][table_name_original] = table_name_original_translation
            
    return translation_map

# Load translation mappings from CSV
def load_translation_mappings_train_dev(csv_path):
    translation_map = {
        'db_id': {},
        'query_toks': {},
        'question': {},
    }
    with open(csv_path, mode='r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            db_id = row['db_id'].strip()
            query_toks = row['query_toks'].strip()
            question = row['question'].strip()

            db_id_translation = row['db_id_id'].strip()
            query_toks_translation = row['query_toks_id'].strip()
            question_translation = row['question_id'].strip()

            if db_id:
                translation_map['db_id'][db_id] = db_id_translation
            if query_toks:
                translation_map['query_toks'][query_toks] = query_toks_translation
            if question:
                translation_map['question'][question] = question_translation
            
    return translation_map

# Normalize name by stripping whitespace, replacing underscores, and converting to lowercase
def normalize_name(name):
    return name.strip().replace('_', ' ').lower()

# Load JSON file
def load_json_file(json_path):
    with open(json_path, 'r', encoding='utf-8') as f:
        return json.load(f)

# Replace values based on the translation map
def replace_values_in_json(data, translation_map, is_table=False):
    for item in data:
        if is_table:
            # Replace table-specific fields
            db_id = normalize_name(item['db_id'])
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace in column_names
            for i, (index, name) in enumerate(item['column_names']):
                clean_name = normalize_name(name)
                item['column_names'][i][1] = translation_map['column_names'].get(clean_name, name)  # Correct reference

            # Replace in column_names_original
            for i, (index, name) in enumerate(item['column_names_original']):
                clean_name = normalize_name(name)
                item['column_names_original'][i][1] = translation_map['column_names_original'].get(clean_name, name)  # Correct reference

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
            db_id = normalize_name(item['db_id'])  # Normalize db_id for consistency
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace query_toks
            item['query_toks'] = [translation_map['query_toks'].get(tok, tok) for tok in item['query_toks']]
            item['query_toks_no_value'] = [translation_map['query_toks'].get(tok, tok) for tok in item['query_toks_no_value']]

            # Replace question
            item['question'] = translation_map['question'].get(item['question'], item['question'])

            # Replace question_toks
            item['question_toks'] = [translation_map['query_toks'].get(tok, tok) for tok in item['question_toks']]

    for item in data:
        if is_table:
            # Replace table-specific fields
            db_id = normalize_name(item['db_id'])
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace in column_names
            for i, (index, name) in enumerate(item['column_names']):
                clean_name = normalize_name(name)
                item['column_names'][i][1] = translation_map['db_id'].get(clean_name, name)

            # Replace in column_names_original
            for i, (index, name) in enumerate(item['column_names_original']):
                clean_name = normalize_name(name)
                item['column_names_original'][i][1] = translation_map['db_id'].get(clean_name, name)

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
            db_id = item['db_id']
            item['db_id'] = translation_map['db_id'].get(db_id, item['db_id'])

            # Replace query_toks
            item['query_toks'] = [translation_map['query_toks'].get(tok, tok) for tok in item['query_toks']]
            item['query_toks_no_value'] = [translation_map['query_toks'].get(tok, tok) for tok in item['query_toks_no_value']]

            # Replace question
            item['question'] = translation_map['question'].get(item['question'], item['question'])

            # Replace question_toks
            item['question_toks'] = [translation_map['query_toks'].get(tok, tok) for tok in item['question_toks']]

# Save the modified JSON
def save_json_file(data, output_path):
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    print("Saved " + output_path)

# Main process
def main():
    # Translate tables.json
    json_data = load_json_file(os.path.join(script_dir, '../data/spider/tables.json'))
    translation_map = load_translation_mappings_table(os.path.join(script_dir, input_paths['tables.json']))
    replace_values_in_json(json_data, translation_map, is_table=True)
    save_json_file(json_data, os.path.join(output_dir, 'tables.json'))

    # Translate dev.json, train_others.json, train_spider.json
    for file_name in ['dev.json', 'train_others.json', 'train_spider.json']:
        json_data = load_json_file(os.path.join(script_dir, f'../data/spider/{file_name}'))
        translation_map = load_translation_mappings_train_dev(os.path.join(script_dir, input_paths[file_name]))
        replace_values_in_json(json_data, translation_map)
        save_json_file(json_data, os.path.join(output_dir, file_name))

if __name__ == "__main__":
    main()
