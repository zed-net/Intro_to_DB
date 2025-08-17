import mysql.connector
from mysql.connector import Error

def get_table_description(alx_book_store, books):
    
    try:
       
        cnx = mysql.connector.connect(
            host=MYSQL_HOST,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD,
            database=alx_book_store
        )
        cursor = cnx.cursor()
        query = f"SHOW CREATE TABLE {books}"
        cursor.execute(query)

        # Fetch the result. The result is a tuple, with the CREATE TABLE
        # statement being the second element (index 1).
        result = cursor.fetchone()
        
        if result:
            print(f"\n--- FULL DESCRIPTION OF TABLE '{books}' ---")
            print(result[1])
            print("-------------------------------------------\n")
        else:
            print(f"ERROR: Table '{books}' not found in database '{alx_book_store}'.")

    except mysql.connector.Error as err:
        # Handle potential connection or query errors
        if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
            print("ERROR: Invalid MySQL username or password.")
        elif err.errno == mysql.connector.errorcode.ER_BAD_TABLE_ERROR:
            print(f"ERROR: Table '{books}' does not exist in database '{dalx_book_store}'.")
        else:
            print(f"An unexpected error occurred: {err}")
    finally:
        # Ensure the cursor and connection are closed
        if 'cnx' in locals() and cnx.is_connected():
            cursor.close()
            cnx.close()