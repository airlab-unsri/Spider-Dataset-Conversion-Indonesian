import sqlite3
import os

def dump_schema(database_path, output_path, pragma=None):
    """
    Dump the schema of an SQLite database to a .sql file.

    Parameters:
        database_path (str): The path to the SQLite database file.
        output_path (str): The path to the output .sql file.
        pragma (str): The PRAGMA statement to add at the beginning of the .sql file, if any.
    """
    # Connect to the SQLite database
    conn = sqlite3.connect(database_path)
    
    conn.text_factory = lambda b: b.decode(errors='ignore')
    cursor = conn.cursor()
    
    if pragma:
        cursor.execute(pragma)

    # Write the PRAGMA statement if provided
    with open(output_path, 'w', encoding='utf-8') as f:
        if pragma:
            f.write(f"{pragma}\n\n")

        # Get all table names from the database
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()

        for table in tables:
            table_name = table[0]  # Extract the table name

            # Get the schema of the table
            cursor.execute(f"SELECT sql FROM sqlite_master WHERE type='table' AND name='{table_name}';")
            schema = cursor.fetchone()[0]
            f.write(f"{schema};\n\n")

    # Close the connection
    conn.close()

def dump_schema_and_data(database_path, output_path, pragma=None):
    """
    Dump the schema and data of an SQLite database to a .sql file.

    Parameters:
        database_path (str): The path to the SQLite database file.
        output_path (str): The path to the output .sql file.
        pragma (str): The PRAGMA statement to add at the beginning of the .sql file, if any.
    """
    # Connect to the SQLite database
    conn = sqlite3.connect(database_path)
    
    conn.text_factory = lambda b: b.decode(errors = 'ignore')
    cursor = conn.cursor()
    
    if pragma:
        cursor.execute(pragma)

    # Write the PRAGMA statement if provided
    with open(output_path, 'w', encoding='utf-8') as f:
        if pragma:
            f.write(f"{pragma}\n\n")

        # Get all table names from the database
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()

        for table in tables:
            table_name = table[0]  # Extract the table name

            # Get the schema of the table
            cursor.execute(f"SELECT sql FROM sqlite_master WHERE type='table' AND name='{table_name}';")
            schema = cursor.fetchone()[0]
            f.write(f"{schema};\n\n")

            # Fetch the data from the table
            cursor.execute(f"SELECT * FROM {table_name};")
            rows = cursor.fetchall()

            # Fetch the column names
            cursor.execute(f"PRAGMA table_info({table_name});")
            columns = [col[1] for col in cursor.fetchall()]

            # Write the data as INSERT statements
            for row in rows:
                values = []
                for val in row:
                    if val is not None:
                        try:
                            # Try to decode bytes to a UTF-8 string
                            safe_val = val.decode('utf-8').replace("'", "''") if isinstance(val, bytes) else str(val).replace("'", "''")
                            values.append(f"'{safe_val}'")
                        except UnicodeDecodeError:
                            # If decoding fails, replace the value with a placeholder
                            values.append("'INVALID_ENCODING'")
                    else:
                        values.append('NULL')
                
                values_str = ', '.join(values)
                f.write(f"INSERT INTO {table_name} ({', '.join([f'`{col}`' for col in columns])}) VALUES ({values_str});\n")
            
            f.write("\n")

    # Close the connection
    conn.close()

def load_database_list(file_path):
    """
    Load a list of database names from a file.

    Parameters:
        file_path (str): Path to the file containing database names.

    Returns:
        list: A list of database names.
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        return [line.strip() for line in f.readlines()]

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Define the input directory and base output directory
    input_dir = os.path.join(script_dir, '../../data/spider/')
    base_output_dir = os.path.join(script_dir, '../../data/extracted/sql_dump/database/')
    
    # Ensure the base output directory exists
    os.makedirs(base_output_dir, exist_ok=True)

    # Load the database names from the classification files
    no_pragma_databases = load_database_list(os.path.join(script_dir, 'no_pragma_databases.txt'))
    off_pragma_databases = load_database_list(os.path.join(script_dir, 'off_pragma_databases.txt'))
    on_pragma_databases = load_database_list(os.path.join(script_dir, 'on_pragma_databases.txt'))

    # Define the PRAGMA statements
    pragma_off = "PRAGMA foreign_keys = OFF;"
    pragma_on = "PRAGMA foreign_keys = ON;"

    # Iterate through each list and process the databases
    for db_name in no_pragma_databases:
        db_filename = f"database/{db_name}/{db_name}.sqlite"
        database_path = os.path.join(input_dir, db_filename)
        output_path_1 = os.path.join(base_output_dir, f"{db_name}/schema.sql")
        output_path_2 = os.path.join(base_output_dir, f"{db_name}/{db_name}.sql")
        
        # Ensure the output directory exists
        os.makedirs(os.path.dirname(output_path_1), exist_ok=True)
        os.makedirs(os.path.dirname(output_path_2), exist_ok=True)
        
        # Dump without any PRAGMA statements
        dump_schema(database_path, output_path_1)
        dump_schema_and_data(database_path, output_path_2)
        print(f"Schema and data dumped (no PRAGMA) to {output_path_2}")

    for db_name in off_pragma_databases:
        db_filename = f"database/{db_name}/{db_name}.sqlite"
        database_path = os.path.join(input_dir, db_filename)
        output_path_1 = os.path.join(base_output_dir, f"{db_name}/schema.sql")
        output_path_2 = os.path.join(base_output_dir, f"{db_name}/{db_name}.sql")
        
        # Ensure the output directory exists
        os.makedirs(os.path.dirname(output_path_1), exist_ok=True)
        os.makedirs(os.path.dirname(output_path_2), exist_ok=True)
        
        # Dump with PRAGMA foreign_keys = OFF
        dump_schema(database_path, output_path_1, pragma_off)
        dump_schema_and_data(database_path, output_path_2, pragma_off)
        print(f"Schema and data dumped (PRAGMA OFF) to {output_path_2}")

    for db_name in on_pragma_databases:
        db_filename = f"database/{db_name}/{db_name}.sqlite"
        database_path = os.path.join(input_dir, db_filename)
        output_path_1 = os.path.join(base_output_dir, f"{db_name}/schema.sql")
        output_path_2 = os.path.join(base_output_dir, f"{db_name}/{db_name}.sql")
        
        # Ensure the output directory exists
        os.makedirs(os.path.dirname(output_path_1), exist_ok=True)
        os.makedirs(os.path.dirname(output_path_2), exist_ok=True)
        
        # Dump with PRAGMA foreign_keys = ON
        dump_schema(database_path, output_path_1, pragma_on)
        dump_schema_and_data(database_path, output_path_2, pragma_on)
        print(f"Schema and data dumped (PRAGMA ON) to {output_path_2}")
