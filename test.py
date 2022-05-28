import json

with open('data1.json') as json_file:
    data = json.load(json_file)

print(data)