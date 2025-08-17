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
                INSERT INTO customer (customer_id, customer_name, email, address) VALUES
(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');

                """
                cursor.execute(query)
    except Error as e:
        # Print a user-friendly error message if the connection fails.
        print(f"Error connecting to MySQL: {e}")
       
    finally:
        # Ensure the cursor and connection are closed
        if 'cnx' in locals() and cnx.is_connected():
            cursor.close()
            cnx.close()
            