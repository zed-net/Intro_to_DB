import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="your_user",  
            password="your_password"  
        )
        mycursor = mydb.cursor()
        
        sql = "CREATE DATABASE IF NOT EXISTS alx_book_store"
        
        mycursor.execute(sql_query)
        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        # Handle specific MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            # Handle other connection errors
            print(f"Failed to connect to the database: {err}")
    
    finally:
        # Ensure the cursor and connection are closed in all cases
        if 'mycursor' in locals() and mycursor is not None:
            mycursor.close()
        if 'mydb' in locals() and mydb is not None and mydb.is_connected():
            mydb.close()
            print("Database connection closed.")