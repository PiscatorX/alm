#!/usr/bin/env python
import argparse
import sqlite3
import csv


parser = argparse.ArgumentParser(description="""load sql""")
parser.add_argument("pfam", type=argparse.FileType('r'))
parser.add_argument('-d','--db_name', help ='SQLite database filename', required = True)
args, unknown = parser.parse_known_args()
db_name  = args.db_name
conx  = sqlite3.connect(db_name)
cur = conx.cursor()
pfam_fobj = csv.reader(args.pfam, delimiter="\t")




init_pfam = """
CREATE TABLE IF NOT EXISTS pfam(
acc VARCHAR(10),
identifier VARCHAR,
description VARCHAR,
PRIMARY KEY(acc))"""

idx_pfam = """CREATE UNIQUE INDEX idx_acc ON pfam (acc);"""

map(conx.execute, [init_pfam, idx_pfam])







i = 1
for row in pfam_fobj:
    print(row)
    if i  == 100:
        break
#     annotation = annotation.strip().split("\t")
#     name, definition = annotation[:2]
#     ec_number  = None
#     if ("[EC:" in definition):
#         definition, ec_number = definition.rstrip("]").split("[EC:")
       
#     elif len(annotation) == 3:
#          ec_number = annotation[2].replace("EC:",'')
#     print(K_number,  name, definition,  ec_number)    
#     sql = """INSERT OR IGNORE INTO kegg_reference(K_number, name, identifier, ec_number)
#                VALUES(?,?,?,?)"""
#     cur.execute(sql, (K_number, name, definition,  ec_number))
# conx.commit()
