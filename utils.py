import os
import csv
import json


def repo_root():
    return os.path.abspath(os.path.join(__file__, os.pardir))


def get_table_headers(connection, table):
    with connection.cursor() as cursor:
        select_all_rows = f"DESC {table}"
        cursor.execute(select_all_rows)
        rows = cursor.fetchall()
        t_headers = ''
        for i in range(0, len(rows)):
            t_headers += rows[i]["Field"]
            if i != (len(rows) - 1): t_headers += ', '
        return t_headers


# data = list with lists
def insert_into_table(connection, table, headers, data):
    with connection.cursor() as cursor:
        for row in data:
            s = ''
            for i in range(0, len(row)):
                try:
                    float(row[i])
                except ValueError:
                    row[i] = "'" + row[i] + "'"
                s += row[i]
                if i != (len(row) - 1): s += ', '
            insert_query = f"INSERT INTO {table} ({headers}) VALUES ({s});"
            cursor.execute(insert_query)
            connection.commit()


def get_data_from_csv(filename, db):
    with open(os.path.join(repo_root(), f'tables_data\\{db}\\{filename}.csv'), newline='') as f:
        reader = csv.reader(f)
        return list(reader)
    

def sql_query(connection, query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        
        
def get_script_for_table(db, table, f):
    with open(os.path.join(repo_root(), f'{f}.json')) as json_file:
        data = json.load(json_file)
    return data[db][table]
