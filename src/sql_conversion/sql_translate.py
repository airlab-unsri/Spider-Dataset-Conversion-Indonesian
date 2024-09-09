import os
import re
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

def translate_all_sql_files(database_folder, translation_dict, output_folder):
    """
    Translates all SQL files in the database folder using the translation dictionary.
    Also translates the folder names and file names.

    Parameters:
    - database_folder: The path to the folder containing .sql files.
    - translation_dict: Dictionary for translating the words.
    - output_folder: Folder where translated SQL files will be saved.
    """
    # Create a 'database' folder inside output_folder
    final_output_folder = os.path.join(output_folder, 'database')
    os.makedirs(final_output_folder, exist_ok=True)

    # Walk through all folders in the database directory
    for root, dirs, files in os.walk(database_folder):
        # Translate folder names
        relative_path = os.path.relpath(root, database_folder)
        translated_folder_name = translate_word(relative_path, translation_dict)
        output_dir = os.path.join(final_output_folder, translated_folder_name)
        os.makedirs(output_dir, exist_ok=True)
        
        for file in files:
            if file.endswith('.sql'):
                file_path = os.path.join(root, file)
                
                # Translate the content of the SQL file
                translated_content = translate_sql_file(file_path, translation_dict)

                # Translate the SQL file name
                file_name_without_ext = os.path.splitext(file)[0]
                translated_file_name = translate_word(file_name_without_ext, translation_dict) + '.sql'
                
                # Save the translated content with translated file name
                output_file_path = os.path.join(output_dir, translated_file_name)
                with open(output_file_path, 'w', encoding='utf-8') as output_file:
                    output_file.write(translated_content)

                print(f"Translated {file_path} -> {output_file_path}")

def main():
    """
    Main function to execute the translation process.
    Defines input paths and translates the SQL files, folder names, and file names.
    """
    # Define path for input SQL files and output folder
    tokens_csv_path = 'data/tokens/tokens_json.csv'  # Path to the CSV file containing translation tokens
    database_folder = 'data/extracted/sql_dump/database'  # Folder containing SQL files to be translated
    output_folder = 'data/converted/spider'  # Output folder to save translated SQL files

    # Load the translation dictionary
    translation_dict = load_translation_dict(tokens_csv_path)
    
    # Translate all SQL files in the database folder and save to output_folder
    translate_all_sql_files(database_folder, translation_dict, output_folder)

if __name__ == "__main__":
    main()
