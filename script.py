from calendar import c
import pymysql

from utils import get_table_headers, get_data_from_csv, insert_into_table, sql_query, get_script_for_table
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
        db_and_tables = {
            "airlines": ['company', 'passenger', 'trip', 'pass_in_trip'],
        }
        
        for db in db_and_tables:
            # Remove DB
            sql_query(connection, f"DROP DATABASE IF EXISTS {db};;")
            # CREATE DB and USE it
            sql_query(connection, f"CREATE DATABASE IF NOT EXISTS {db};")
            sql_query(connection, f"USE {db}")
            print(f"Writing to {db}...")
            for table in db_and_tables[db]:
                # CREATE TABLE
                sql_query(connection, get_script_for_table(db, table, "scripts"))
                # FILL TABLE
                insert_into_table(connection, table, get_table_headers(connection, table), get_data_from_csv(table, db))
                print(f"✔️ - Done writing to {table}")

    finally:
        connection.close()

except Exception as ex:
    print("Connection refused...")
    print(ex)