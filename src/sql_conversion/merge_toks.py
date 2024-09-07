import csv
import os

def read_tokens(file_path):
    """
    Read tokens from a CSV file and return a set of tuples.

    Parameters:
        file_path (str): Path to the CSV file.

    Returns:
        set: A set of tuples containing tokens and their corresponding ID.
    """
    tokens_set = set()

    try:
        with open(file_path, 'r', encoding='utf-8') as infile:
            reader = csv.DictReader(infile)
            for row in reader:
                toks = row.get('toks', '').strip()
                toks_id = row.get('toks_id', '').strip() if 'toks_id' in row else ''
                if toks:  # Ensure that toks is not empty
                    tokens_set.add((toks, toks_id))
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
    
    return tokens_set

def merge_tokens(file1, file2, output_file):
    """
    Merge tokens from two CSV files into a single CSV file, removing duplicates.

    Parameters:
        file1 (str): Path to the first CSV file.
        file2 (str): Path to the second CSV file.
        output_file (str): Path to the output CSV file.
    """
    # Read tokens from both files
    tokens_set1 = read_tokens(file1)
    tokens_set2 = read_tokens(file2)

    # Combine tokens and remove duplicates
    all_tokens = tokens_set1.union(tokens_set2)

    # Write the merged tokens to the output file
    try:
        with open(output_file, 'w', newline='', encoding='utf-8') as outfile:
            fieldnames = ['toks', 'toks_id']
            writer = csv.DictWriter(outfile, fieldnames=fieldnames)
            writer.writeheader()

            for token, token_id in all_tokens:
                writer.writerow({
                    'toks': token,
                    'toks_id': token_id,
                })

        print(f"Merged tokens extraction completed. Output saved as: {output_file}")

    except Exception as e:
        print(f"An error occurred while writing to {output_file}: {e}")

if __name__ == "__main__":
    # Define absolute file paths
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the directory of the current script
    file1 = os.path.join(script_dir, '../../data/tokens/tokens_json.csv')
    file2 = os.path.join(script_dir, '../../data/tokens/tokens_json_2.csv')
    output_file = os.path.join(script_dir, '../../data/tokens/merged_tokens_json.csv')

    # Merge the tokens
    merge_tokens(file1, file2, output_file)
