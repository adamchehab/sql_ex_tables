import os
import pymysql

from utils import repo_root, get_table_headers, get_data_from_csv, insert_into_table

from config import DATABASE, HOST, PORT, USER, PASSWORD


try:
    connection = pymysql.connect(
        host=HOST,
        port=PORT,
        user=USER,
        password=PASSWORD,
        database=DATABASE,
        cursorclass=pymysql.cursors.DictCursor
    )
    print("Successfully connected to database...")
    
    try:
        
        # tables = os.listdir(os.path.join(repo_root(), f'tables_data\\{DATABASE}'))
        tables = ['company', 'passenger', 'trip', 'pass_in_trip']
        
        print(f"Writing to {DATABASE}...")
        
        for table in tables:
            
            table = table.replace('.csv','')
            headers = get_table_headers(connection, table)
            data = get_data_from_csv(table, DATABASE)
            
            insert_into_table(connection, table, headers, data)
            print(f"✔️ - Done writing to {table}")

    finally:
        connection.close()

except Exception as ex:
    print("Connection refused...")
    print(ex)