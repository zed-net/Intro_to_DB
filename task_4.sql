import mysql.connector
from mysql.connector import Error

def _books(alx_book_store):
    try:
        # Connect to MySQL
        conn = mysql.connector.connect(
            host="localhost",        # change if needed
            user="root",             # change to your username
            password="your_password",# change to your password
            database=alx_book_store
        )

        cursor = conn.cursor()
        query = """
        SELECT *
        FROM alx_book_store
        
        """
        cursor.execute(query, (alx_book_store,))
        rows = cursor.fetchall()

        # Print header like DESCRIBE output
        print(f"{'Field':<20} {'Type':<20} {'Null':<10} {'Key':<10} {'Default':<15} {'Extra'}")
        print("-" * 90)

        for row in rows:
            field, col_type, is_nullable, col_key, col_default, extra = row
            print(f"{field:<20} {col_type:<20} {is_nullable:<10} {col_key:<10} {str(col_default):<15} {extra}")

    except Error as e:
        print(f"Error: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()
