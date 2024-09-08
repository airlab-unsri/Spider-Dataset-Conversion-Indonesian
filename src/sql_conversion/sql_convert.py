import sqlite3
import os

def execute_sql_script(database_path, sql_script_path):
    """
    Execute a SQL script file to create or update an SQLite database.

    Parameters:
        database_path (str): The path to the SQLite database file.
        sql_script_path (str): The path to the SQL script file.
    """
    # Connect to the SQLite database (creates the file if it doesn't exist)
    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()
    
    # Disable journaling and set synchronous to OFF for faster performance
    cursor.execute('PRAGMA journal_mode = OFF;')
    cursor.execute('PRAGMA synchronous = OFF;')

    # Execute the SQL script in one go using executescript
    with open(sql_script_path, 'r', encoding='utf-8') as f:
        sql_script = f.read()

    try:
        # Use a single transaction for all statements
        conn.executescript(sql_script)
    except sqlite3.Error as e:
        print(f"An error occurred while executing the SQL script: {e}")
    finally:
        # Re-enable journaling and synchronous mode for safety
        cursor.execute('PRAGMA synchronous = FULL;')
        cursor.execute('PRAGMA journal_mode = DELETE;')

    # Commit changes and close the connection
    conn.commit()
    conn.close()

def process_sql_files(input_base_dir, output_base_dir):
    """
    Convert .sql files to .sqlite files by executing the SQL script on a new SQLite database.
    This function processes all subdirectories in the input base directory.

    Parameters:
        input_base_dir (str): The base directory containing subdirectories with .sql files.
        output_base_dir (str): The base directory where the .sqlite files will be saved.
    """
    # Ensure the output base directory exists
    os.makedirs(output_base_dir, exist_ok=True)

    # Iterate over each subdirectory in the input base directory
    for db_name in os.listdir(input_base_dir):
        db_input_dir = os.path.join(input_base_dir, db_name)
        
        # Check if it's a directory
        if os.path.isdir(db_input_dir):
            sql_file_path = os.path.join(db_input_dir, f"{db_name}.sql")
            
            # Ensure the SQL file exists
            if os.path.exists(sql_file_path):
                output_dir = os.path.join(output_base_dir, db_name)
                os.makedirs(output_dir, exist_ok=True)
                
                database_path = os.path.join(output_dir, f"{db_name}.sqlite")
                
                # Convert .sql to .sqlite
                execute_sql_script(database_path, sql_file_path)
                print(f"Converted {sql_file_path} to {database_path}")
            else:
                print(f"SQL file {db_name}.sql not found in {db_input_dir}")

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Define the input and output base directories
    input_base_dir = os.path.join(script_dir, '../../data/extracted/sql_dump/database-id/')
    output_base_dir = os.path.join(script_dir, '../../data/converted/spider/database/')
    
    # Process the SQL files
    process_sql_files(input_base_dir, output_base_dir)
