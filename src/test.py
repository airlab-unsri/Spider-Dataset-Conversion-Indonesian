import os
from googletrans import Translator
from concurrent.futures import ThreadPoolExecutor, as_completed
import time

def translate_batch(translator, lines, src_lang, dest_lang, retries=3):
    attempt = 0
    while attempt < retries:
        try:
            translations = translator.translate(lines, src=src_lang, dest=dest_lang)
            return [translation.text for translation in translations]
        except Exception as e:
            print(f"Error during batch translation: {e}")
            attempt += 1
            time.sleep(2)  # Wait for 2 seconds before retrying
    return []

def bulk_translate(input_file, output_file, src_lang='en', dest_lang='id', batch_size=100):
    # Initialize translator
    translator = Translator()
    
    # Get the absolute path of the current script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_file = os.path.join(script_dir, input_file)
    output_file = os.path.join(script_dir, output_file)
    
    # Read the list of strings from the input file
    try:
        with open(input_file, 'r', encoding='utf-8') as file:
            lines = [line.strip() for line in file.readlines()]
    except FileNotFoundError:
        print(f"Error: File '{input_file}' does not exist.")
        return
    
    # Split lines into batches
    batches = [lines[i:i + batch_size] for i in range(0, len(lines), batch_size)]
    
    # Translate all batches concurrently
    translated_lines = []
    with ThreadPoolExecutor() as executor:
        futures = {executor.submit(translate_batch, translator, batch, src_lang, dest_lang): batch for batch in batches}
        for future in as_completed(futures):
            result = future.result()
            if result:
                translated_lines.extend(result)
            else:
                print(f"Failed to translate batch: {futures[future]}")
    
    # Write the translated lines to the output file
    try:
        with open(output_file, 'w', encoding='utf-8') as file:
            for translated_line in translated_lines:
                file.write(translated_line + '\n')
        print(f"Translation completed. Output saved as: {output_file}")
    except Exception as e:
        print(f"Error writing to output file: {e}")

if __name__ == "__main__":
    # Define input and output files
    input_file = 'input.txt' 
    output_file = 'translated_output.txt'  
    
    # Perform bulk translation
    bulk_translate(input_file, output_file)