import os
import re
import pandas as pd
from concurrent.futures import ThreadPoolExecutor

def load_translation_dict(csv_file_path):
    """
    Loads translation dictionary from a CSV file.

    Parameters:
    - csv_file_path: Path to the tokens CSV file containing 'english' and 'indonesia' columns.

    Returns:
    - A dictionary with 'english' as keys and 'indonesia' as values.
    """
    df = pd.read_csv(csv_file_path)
    df.columns = ['english', 'indonesia']  # Ensure correct column names
    translation_dict = df.set_index('english')['indonesia'].to_dict()  # Create dictionary from DataFrame
    return translation_dict

def translate_word(word, translation_dict):
    """
    Translates a word using a provided dictionary. If the word is not found, it returns the original word.

    Parameters:
    - word: The word to be translated.
    - translation_dict: The dictionary used for translation.

    Returns:
    - Translated word in lowercase if found in the dictionary, otherwise the original word in lowercase.
    """
    return translation_dict.get(word, word)  # Convert both word and its translation to lowercase

def translate_sql_content(content, translation_dict):
    """
    Translates SQL content using the translation dictionary.

    Parameters:
    - content: The content of the SQL file as a string.
    - translation_dict: Dictionary for translating the words.

    Returns:
    - Translated content as a string.
    """
    def replace_match(match):
        word = match.group(0)
        return translate_word(word, translation_dict)
    
    # Use regex to replace words with their translations
    return re.sub(r'[%0-9a-zA-Z_]+', replace_match, content)

def process_sql_file(file_path, translation_dict, output_folder):
    """
    Processes a single SQL file: translates its content and saves it with a translated name.

    Parameters:
    - file_path: Path to the SQL file to be processed.
    - translation_dict: Dictionary for translating the words.
    - output_folder: Folder where the processed file will be saved.
    """
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    
    translated_content = translate_sql_content(content, translation_dict)

    file_name_without_ext = os.path.splitext(os.path.basename(file_path))[0]
    translated_file_name = translate_word(file_name_without_ext, translation_dict) + '.sql'
    output_file_path = os.path.join(output_folder, translated_file_name)
    
    with open(output_file_path, 'w', encoding='utf-8') as output_file:
        output_file.write(translated_content)

    print(f"Translated and saved: {file_path} -> {output_file_path}")

def translate_all_sql_files(database_folder, translation_dict, output_folder):
    """
    Translates all SQL files in the database folder using the translation dictionary.
    Also translates the folder names and file names.

    Parameters:
    - database_folder: The path to the folder containing .sql files.
    - translation_dict: Dictionary for translating the words.
    - output_folder: Folder where translated SQL files will be saved.
    """
    os.makedirs(output_folder, exist_ok=True)

    def process_folder(root, dirs, files):
        # Translate folder names
        relative_path = os.path.relpath(root, database_folder)
        translated_folder_name = translate_word(relative_path, translation_dict)
        output_dir = os.path.join(output_folder, translated_folder_name)
        os.makedirs(output_dir, exist_ok=True)
        
        # Process each file in the folder
        for file in files:
            if file.endswith('.sql'):
                file_path = os.path.join(root, file)
                process_sql_file(file_path, translation_dict, output_dir)

    # Use ThreadPoolExecutor to process files in parallel
    with ThreadPoolExecutor(max_workers=4) as executor:
        for root, dirs, files in os.walk(database_folder):
            executor.submit(process_folder, root, dirs, files)

def main():
    """
    Main function to execute the translation process.
    Defines input paths and translates the SQL files, folder names, and file names.
    """
    # Define path for input SQL files and output folder
    tokens_csv_path = 'data/tokens/tokens_json.csv'  # Path to the CSV file containing translation tokens
    database_folder = 'data/extracted/sql_dump/database'  # Folder containing SQL files to be translated
    output_folder = 'data/converted/spider/database'  # Output folder to save translated SQL files

    # Load the translation dictionary
    translation_dict = load_translation_dict(tokens_csv_path)
    
    # Translate all SQL files in the database folder and save to output_folder
    translate_all_sql_files(database_folder, translation_dict, output_folder)

if __name__ == "__main__":
    main()
