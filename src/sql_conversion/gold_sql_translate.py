import json
import os
from collections import defaultdict

def extract_queries_to_sql(json_file, output_sql):
    """
    Extracts the 'query' and 'db_id' fields from a JSON file, groups them by 'db_id' 
    based on their first appearance, and writes each query followed by a tab and its 
    corresponding 'db_id' to a new line in an SQL file.

    Parameters:
    - json_file: Path to the input JSON file containing the data.
    - output_sql: Path to the output SQL file where the extracted queries will be saved.
    """
    try:
        with open(json_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        # Create a dictionary to group queries by db_id
        grouped_queries = defaultdict(list)

        # Preserve the order of db_id based on first appearance
        order_of_db_ids = []

        for item in data:
            query = item.get('query', '').strip()
            db_id = item.get('db_id', '')
            if query and db_id:
                if db_id not in grouped_queries:
                    order_of_db_ids.append(db_id)
                grouped_queries[db_id].append(query)

        # Write the grouped queries to the SQL file
        with open(output_sql, 'w', encoding='utf-8') as sqlfile:
            for db_id in order_of_db_ids:
                for query in grouped_queries[db_id]:
                    sqlfile.write(f"{query}\t{db_id}\n")

        print(f"Queries extracted and grouped by db_id in: {output_sql}")

    except Exception as e:
        print(f"An error occurred: {e}")


def combine_sql_files(file1, file2, output_file):
    """
    Combines the contents of two SQL files into one, with the contents of file1 first.

    Parameters:
    - file1: Path to the first SQL file (contents will appear first).
    - file2: Path to the second SQL file (contents will appear second).
    - output_file: Path to the combined output SQL file.
    """
    try:
        with open(output_file, 'w', encoding='utf-8') as outfile:
            # Write contents of file1
            with open(file1, 'r', encoding='utf-8') as f1:
                outfile.write(f1.read())

            # Write contents of file2
            with open(file2, 'r', encoding='utf-8') as f2:
                outfile.write(f2.read())

        print(f"SQL files combined and saved in: {output_file}")

    except Exception as e:
        print(f"An error occurred while combining files: {e}")


def main():
    """
    Main function to manage the extraction of queries from multiple JSON files
    and then combine them into a single SQL file.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the directory of the current script
    
    # Define the input JSON files and corresponding output SQL files
    input_output_files = {
        'train_spider.json': 'train_spider_gold.sql',
        'train_others.json': 'train_others_gold.sql',
        'dev.json': 'dev_gold.sql'
    }

    input_dir = os.path.join(script_dir, '../../data/converted/spider/')  # Directory containing the input JSON files
    output_dir = os.path.join(script_dir, '../../data/converted/spider/')  # Directory to save the output SQL files

    # Ensure the output directory exists, create it if not
    os.makedirs(output_dir, exist_ok=True)

    # Process each file and extract the queries
    for json_filename, sql_filename in input_output_files.items():
        json_path = os.path.join(input_dir, json_filename)
        sql_path = os.path.join(output_dir, sql_filename)

        # Extract queries to the SQL file
        extract_queries_to_sql(json_path, sql_path)

    # Combine train_others_gold.sql and train_spider_gold.sql into train_gold.sql
    train_spider_sql = os.path.join(output_dir, 'train_spider_gold.sql')
    train_others_sql = os.path.join(output_dir, 'train_others_gold.sql')
    combined_sql = os.path.join(output_dir, 'train_gold.sql')

    combine_sql_files(train_spider_sql, train_others_sql, combined_sql)


if __name__ == "__main__":
    main()
