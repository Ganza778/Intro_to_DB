-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    authorID INT,
    price DOUBLE,
    publication_date DATE,
    CONSTRAINT fk_author
        FOREIGN KEY (authorID)
        REFERENCES Authors(authorID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    order_date DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (customerID)
        REFERENCES Customers(customerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    bookID INT,
    quantity DOUBLE,
    CONSTRAINT fk_order
        FOREIGN KEY (orderID)
        REFERENCES Orders(orderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_book
        FOREIGN KEY (bookID)
        REFERENCES Books(bookID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
