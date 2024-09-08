import sqlite3
import os

def dump_schema_and_data(database_path, output_path):
    """
    Dump the schema and data of an SQLite database to a .sql file.

    Parameters:
        database_path (str): The path to the SQLite database file.
        output_path (str): The path to the output .sql file.
    """
    # Connect to the SQLite database
    conn = sqlite3.connect(database_path)
    cursor = conn.cursor()

    # Get the schema of the database
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema = cursor.fetchall()

    # Write the schema and data to the output file
    with open(output_path, 'w') as f:
        for table_schema in schema:
            if table_schema[0]:  # Ensure the schema is not None
                f.write(f"{table_schema[0]};\n\n")

                # Extract the table name from the CREATE TABLE statement
                table_name = table_schema[0].split()[2]

                # Fetch the data from the table
                cursor.execute(f"SELECT * FROM {table_name};")
                rows = cursor.fetchall()

                # Fetch the column names
                cursor.execute(f"PRAGMA table_info({table_name});")
                columns = [col[1] for col in cursor.fetchall()]

                # Write the data as INSERT statements
                for row in rows:
                    # Separate the replacement logic for clarity
                    values = []
                    for val in row:
                        if val is not None:
                            # If val contains a single quote, escape it by doubling the single quote
                            safe_val = str(val).replace("'", "''")
                            values.append(f"'{safe_val}'")
                        else:
                            values.append('NULL')
                    
                    # Join the values into the SQL statement
                    values_str = ', '.join(values)
                    f.write("INSERT INTO {} ({}) VALUES ({});\n".format(table_name, ', '.join(columns), values_str))
                
                f.write("\n")

    # Close the connection
    conn.close()

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Define the input directory and base output directory
    input_dir = os.path.join(script_dir, '../../data/spider/')
    base_output_dir = os.path.join(script_dir, '../../data/extracted/sql_dump/')
    
    # Ensure the base output directory exists
    os.makedirs(base_output_dir, exist_ok=True)
    
    # List of SQLite database files to process
    database_files = ['database/aircraft/aircraft.sqlite']
    
    # Iterate through the database files and process them
    for db_filename in database_files:
        database_path = os.path.join(input_dir, db_filename)
        output_path = os.path.join(base_output_dir, os.path.splitext(db_filename)[0] + '.sql')
        
        # Ensure the output directory exists
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        
        # Dump the schema and data
        dump_schema_and_data(database_path, output_path)
        print(f"Schema and data dumped to {output_path}")
