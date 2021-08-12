#!/bin/python3

import json

with open('pots.json') as json_file:
    data = json.load(json_file)
    for key in data:
        print([key, data[key]['sol'], data[key]['trace']])

