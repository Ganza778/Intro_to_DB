-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author-id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book-id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author-id INT,
    price DOUBLE,
    publication_date DATE,
    CONSTRAINT fk_author
        FOREIGN KEY (author-id)
        REFERENCES Authors(author-id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer-id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order-id INT AUTO_INCREMENT PRIMARY KEY,
    customer-id INT,
    order_date DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer-id)
        REFERENCES Customers(customer-id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetail-id INT AUTO_INCREMENT PRIMARY KEY,
    order-id INT,
    book-id INT,
    quantity DOUBLE,
    CONSTRAINT fk_order
        FOREIGN KEY (order-id)
        REFERENCES Orders(order-id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_book
        FOREIGN KEY (book-id)
        REFERENCES Books(book-id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
