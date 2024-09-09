import os
import re
import shutil
import pandas as pd

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
    return translation_dict.get(word.lower(), word.lower())  # Convert both word and its translation to lowercase

def translate_sql_file(file_path, translation_dict):
    """
    Translates the content of an SQL file using the translation dictionary.

    Parameters:
    - file_path: Path to the SQL file to be translated.
    - translation_dict: Dictionary for translating the words.

    Returns:
    - Translated content as a string.
    """
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Use regex to find all words consisting of letters and underscores, excluding numbers
    words = re.findall(r'\b[a-zA-Z_]+\b', content)
    
    # Replace each word in the content with its translation
    for word in words:
        translated_word = translate_word(word, translation_dict)
        content = content.replace(word, translated_word)  # Replace the word with its translation

    return content

def translate_path(path, translation_dict):
    """
    Translates a path (folder or file name) by applying the translation dictionary.

    Parameters:
    - path: The original path to translate.
    - translation_dict: Dictionary for translating the words.

    Returns:
    - Translated path with folder and file names translated accordingly.
    """
    # Split the path into components and translate each part
    parts = path.split(os.sep)
    translated_parts = [translate_word(part, translation_dict) for part in parts]
    
    # Reconstruct the path using the translated parts
    return os.sep.join(translated_parts)

def translate_all_sql_files(database_folder, translation_dict, output_folder):
    """
    Translates all SQL files in the database folder using the translation dictionary.
    Translates folder names, file names, and the contents of the SQL files, then saves the result to output_folder.

    Parameters:
    - database_folder: The path to the folder containing .sql files.
    - translation_dict: Dictionary for translating the words.
    - output_folder: The folder where the translated SQL files and structure will be saved.
    """
    # Walk through all folders in the database directory
    for root, dirs, files in os.walk(database_folder, topdown=False):
        # Translate and copy files
        for file in files:
            if file.endswith('.sql'):  # Check if the file ends with .sql
                file_path = os.path.join(root, file)
                translated_content = translate_sql_file(file_path, translation_dict)
                
                # Translate the file name
                translated_file_name = translate_word(file, translation_dict)
                
                # Construct the corresponding path in the output folder
                relative_path = os.path.relpath(root, database_folder)  # Relative path from database_folder
                translated_relative_path = translate_path(relative_path, translation_dict)  # Translate the relative path
                output_dir = os.path.join(output_folder, translated_relative_path)  # Construct the output directory path
                os.makedirs(output_dir, exist_ok=True)  # Create the output directory if it doesn't exist
                
                # Save the translated content in the new folder
                translated_file_path = os.path.join(output_dir, translated_file_name)
                with open(translated_file_path, 'w', encoding='utf-8') as output_file:
                    output_file.write(translated_content)
                
                print(f"Translated and saved: {file_path} -> {translated_file_path}")

        # Translate and copy directories
        for dir_name in dirs:
            original_dir_path = os.path.join(root, dir_name)
            translated_dir_name = translate_word(dir_name, translation_dict)
            
            # Construct the corresponding translated path in the output folder
            relative_path = os.path.relpath(original_dir_path, database_folder)
            translated_relative_path = translate_path(relative_path, translation_dict)
            output_dir = os.path.join(output_folder, translated_relative_path)
            os.makedirs(output_dir, exist_ok=True)  # Create the translated directory
            
            print(f"Translated directory: {original_dir_path} -> {output_dir}")

def main():
    """
    Main function to execute the translation process.
    Defines input and output paths, translates the SQL files, and copies them to the output folder.
    """
    # Define path for input SQL files and output folder
    tokens_csv_path = 'data/tokens/tokens_json.csv'  # Path to the CSV file containing translation tokens
    database_folder = 'data/extracted/sql_dump/database'  # Folder containing SQL files to be translated
    output_folder = 'data/converted/spider'  # Output folder to save translated SQL files
    
    # Load the translation dictionary
    translation_dict = load_translation_dict(tokens_csv_path)
    
    # Translate all SQL files and folder/file names, then save them to the output folder
    translate_all_sql_files(database_folder, translation_dict, output_folder)

if __name__ == "__main__":
    main()
