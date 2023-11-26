import csv
import json
import os

CURRENT_DIR:    str = os.path.dirname(__file__)
CSV_FILE_PATH:  str = os.path.join(CURRENT_DIR, "dataset-cids.csv")
JSON_FILE_PATH: str = os.path.join(CURRENT_DIR, "dataset-cids.json")

# convert CSV to list of Python dictionaries
data: list = []
with open(CSV_FILE_PATH, 'r') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=";")
    for row in csv_reader:
        # change keys in the dictionary
        row['code'] = row['CODE']
        row['short_description'] = row['SHORT DESCRIPTION (VALID ICD-10 FY2024)']
        row['long_description'] = row['LONG DESCRIPTION (VALID ICD-10 FY2024)']
        del row['CODE']
        del row['SHORT DESCRIPTION (VALID ICD-10 FY2024)']
        del row['LONG DESCRIPTION (VALID ICD-10 FY2024)']
        del row['NF EXCL']
        data.append(row)

# output JSON
with open(JSON_FILE_PATH, 'w') as json_file:
    json.dump(data, json_file, indent=2)

print(f"Successfully converted {CSV_FILE_PATH}. JSON has been saved to {JSON_FILE_PATH}")    