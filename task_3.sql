import mysql.connector
from mysql.connector import Error

def list_tables(alx_book_store):
    try:
        # connect to MySQL
        conn = mysql.connector.connect(
            host="localhost",      # change if needed
            user="root",           # change to your username
            password="your_password", # change to your password
            database=alx_book_store
        )

        if conn.is_connected():
            cursor = conn.cursor()
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()
            print(f"Tables in database '{alx_book_store}':")
            for table in tables:
                print(table[0])

    except Error as e:
        print(f"Error: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()