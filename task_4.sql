import mysql.connector
from mysql.connector import Error

def get_table_description(alx_book_store, books):
    
   try:
        # Establish a connection to the MySQL database.
        with connect(
            host=host,
            user=user,
            password=password,
            database= alx_book_store
        ) as connection:
            # Create a cursor object to execute SQL queries.
            with connection.cursor() as cursor:
            
                query = """
                SELECT COLUMN_NAME, COLUMN_TYPE
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books'
                """
                cursor.execute(query)
                result = cursor.fetchall()

                # Print the column details.
                print("Column Name | Column Type")
                print("---------------------")
                for column in result:
                    print(f"{column[0]} | {column[1]}")

    except Error as e:
        # Print a user-friendly error message if the connection fails.
        print(f"Error connecting to MySQL: {e}")
       
    finally:
        # Ensure the cursor and connection are closed
        if 'cnx' in locals() and cnx.is_connected():
            cursor.close()
            cnx.close()