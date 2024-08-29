import subprocess

def run_command(command):
    """
    Run a shell command and print its output.

    Parameters:
        command (str): The command to run.
    """
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {command}")
        print(e.stderr)

if __name__ == "__main__":
    commands = [
        "pip install -r requirements.txt",
        "python src/extract.py",
        "python src/translate.py",
        "python src/clean.py",
        "python src/convert.py",
        "python src/combine.py"
    ]

    for command in commands:
        run_command(command)