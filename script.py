import os
import pymysql

from utils import repo_root
from utils import get_table_headers
from utils import get_data_from_csv
from utils import insert_into_table


DATABASE = "airlines"

# OPTIONS:
#   pc_company - Компьютерная фирма
#   recycling_company - Фирма вторсырья
#   ships - Корабли
#   airlines - Аэрофлот
#   paint - Окраска


try:
    connection = pymysql.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="1212",
        database=DATABASE,
        cursorclass=pymysql.cursors.DictCursor
    )
    print("Successfully connected to database...")
    
    try:
        
        tables = os.listdir(os.path.join(repo_root(), f'tables_data\\{DATABASE}'))
        
        for table in tables:
            
            table = table.replace('.csv','')
            headers = get_table_headers(connection, table)
            data = get_data_from_csv(table, DATABASE)
            
            print(f"Writing to {DATABASE}...")
            insert_into_table(connection, table, headers, data)
            print(f"✔️ - Done writing to {table}")

    finally:
        connection.close()

except Exception as ex:
    print("Connection refused...")
    print(ex)