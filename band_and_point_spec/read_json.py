#!/bin/python3
# read in the json file 'pots.json' and print out its content

import json

with open('pots.json') as json_file:
    data = json.load(json_file)
    for key in data:
        print([key, data[key]['sol'], data[key]['trace']])
