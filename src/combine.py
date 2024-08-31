import os
import json

# Set up paths
script_dir = os.path.dirname(os.path.abspath(__file__))
input_dir = os.path.join(script_dir, '../data/converted/spider/')
output_path = os.path.join(input_dir, 'train.json')

# Load JSON file
def load_json_file(json_path):
    with open(json_path, 'r', encoding='utf-8') as f:
        return json.load(f)

# Save the combined JSON
def save_json_file(data, output_path):
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    print("Saved " + output_path)

# Main process
def main():
    # Load train_others.json and train_spider.json
    train_others = load_json_file(os.path.join(input_dir, 'train_others.json'))
    train_spider = load_json_file(os.path.join(input_dir, 'train_spider.json'))
    
    # Combine the data
    combined_data = train_others + train_spider
    
    # Save the combined data
    save_json_file(combined_data, output_path)

if __name__ == '__main__':
    main()
