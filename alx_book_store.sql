-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE
);

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE
);

-- Add foreign key constraints to the tables
ALTER TABLE Books
ADD FOREIGN KEY (author_id) REFERENCES Authors(author_id);

ALTER TABLE Orders
ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);

ALTER TABLE Order_Details
ADD FOREIGN KEY (order_id) REFERENCES Orders(order_id);

ALTER TABLE Order_Details
ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);
