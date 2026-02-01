import csv

filename = "startups.csv"

data = """
name	location	category	employees	raised	valuation	founded	stage	ceo	info
Pied Piper	Silicon Valley	Cloud Computing	6	5000000	50000000	2014	A	Richard Hendricks	A Middle-Out Compression Solution
Hooli	Silicon Valley	Enterprise	9000	580000000	49500000000	1997	NULL	Gavin Bensen	Hooli Is About People
"""
data_lines = data.split('\n')

fieldnames = data_lines[1].split('\t')
data_dicts = []

for line in data_lines[2:-1]:
    fields = [f.replace('NULL', '') for f in line.split("\t")]
    row_dict = zip(fieldnames, fields)
    data_dicts.append(dict(row_dict))

with open(filename, 'w', encoding='utf-8', newline='') as file:
    writer = csv.DictWriter(file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(data_dicts)
