CREATE DATABASE BookStore_DB;
USE BookStore_DB;
show databases ; -- Just checking if creation was successful

-- 1. Table: book_language
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL
);

-- 2. Table: publisher
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- 3. Table: author
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    bio TEXT
);

-- 4. Table: book
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    ISBN VARCHAR(20),
    publication_year INT,
    price DECIMAL(10, 2),
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- 5. Table: book_author (Many-to-Many relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 6. Table: customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone_numb VARCHAR(20)
);

-- 7. Table: address_status
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    address_status_name VARCHAR(50)
);

-- 8. Table: country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100)
);

-- 9. Table: address (general address table)
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    town VARCHAR(100),
    country_code VARCHAR(10),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- 10. Table: customer_address
CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    address_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- 11. Table: shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100),
    shipping_cost DECIMAL(10, 2),
    estimated_days INT
);

-- 12. Table: order_status
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100)
);

-- 13. Table: cust_order
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    status_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- 14. Table: order_line
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 15. Table: order_history
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    change_date DATE,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Checking to see if all tables have been created successfully .
USE BookStore_DB;
show tables;



-- Book Language
INSERT INTO book_language (language_name) VALUES ('English'), ('French');

-- Publisher
INSERT INTO publisher (name, email, phone) VALUES ('O’Reilly Media', 'info@oreilly.com', '123-456-7890');

-- Author
INSERT INTO author (first_name, last_name, bio) VALUES ('Robert', 'Martin', 'Software craftsmanship enthusiast.');

-- Book
INSERT INTO book (title, ISBN, publication_year, price, publisher_id, language_id)
VALUES ('Clean Code', '9780132350884', 2008, 35.50, 1, 1);

-- Book Author
INSERT INTO book_author (book_id, author_id) VALUES (1, 1);

-- Customer
INSERT INTO customer (first_name, last_name, email, phone_numb)
VALUES ('Irke', 'Konzolo', 'irke@mail.com', '0700000000');

-- Address Status
INSERT INTO address_status (address_status_name) VALUES ('Current'), ('Old');

-- Country
INSERT INTO country (country_name) VALUES ('Kenya'), ('USA');

-- Address
INSERT INTO address (town, country_code, country_id)
VALUES ('Nairobi', 'KE', 1), ('San Francisco', 'US', 2);

-- Customer Address
INSERT INTO customer_address (customer_id, address_id, address_status_id)
VALUES (1, 1, 1);

-- Shipping Method
INSERT INTO shipping_method (method_name, shipping_cost, estimated_days)
VALUES ('Standard', 5.00, 7), ('Express', 10.00, 3);

-- Order Status
INSERT INTO order_status (status_name) VALUES ('Pending'), ('Shipped');

-- Customer Order
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id, total_amount)
VALUES (1, CURDATE(), 1, 1, 35.50);

-- Order Line
INSERT INTO order_line (order_id, book_id, quantity, unit_price)
VALUES (1, 1, 1, 35.50);

-- Order History
INSERT INTO order_history (order_id, status_id, change_date)
VALUES (1, 1, CURDATE());



INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Swahili');
    
    INSERT INTO publisher (name, email, phone) VALUES
('Penguin Random House', 'contact@penguin.com', '0711000000'),
('HarperCollins', 'support@harpercollins.com', '0722000000'),
('Macmillan Publishers', 'info@macmillan.com', '0733000000'),
('Simon & Schuster', 'hello@simonandschuster.com', '0744000000'),
('Oxford University Press', 'info@oup.com', '0755000000');

INSERT INTO author (first_name, last_name, bio) VALUES
('George', 'Orwell', 'Known for dystopian novels.'),
('Chinua', 'Achebe', 'Renowned Nigerian author.'),
('Jane', 'Austen', 'Famous British novelist.'),
('Ngũgĩ', 'wa Thiong\'o', 'Kenyan writer and academic.'),
('J.K.', 'Rowling', 'Author of the Harry Potter series.');


INSERT INTO book (title, ISBN, publication_year, price, publisher_id, language_id) VALUES
('1984', '9780451524935', 1949, 15.99, 1, 1),
('Things Fall Apart', '9780385474542', 1958, 12.99, 2, 5),
('Pride and Prejudice', '9780141439518', 1813, 9.99, 3, 1),
('Wizard of the Crow', '9780099520645', 2006, 17.49, 4, 5),
('Harry Potter and the Sorcerer\'s Stone', '9780590353427', 1997, 22.95, 5, 1);

INSERT INTO book_author (book_id, author_id) VALUES
(6, 6),  -- 1984 - Orwell
(2, 2),  -- Things Fall Apart - Achebe
(3, 3),  -- Pride and Prejudice - Austen
(4, 4),  -- Wizard of the Crow - Ngũgĩ
(5, 5);  -- Harry Potter - Rowling


INSERT INTO customer (first_name, last_name, email, phone_numb) VALUES
('Irke', 'Konzolo', 'irke@mail.com', '0711223344'),
('Grace', 'Mwende', 'grace.mwende@gmail.com', '0722123456'),
('John', 'Doe', 'john.doe@example.com', '0733123456'),
('Alice', 'Wambui', 'alice.wambui@domain.com', '0744123456'),
('Mark', 'Otieno', 'mark.otieno@mail.com', '0755123456');


INSERT INTO address_status (address_status_name) VALUES
('Current'),
('Old'),
('Billing'),
('Shipping'),
('Permanent');


INSERT INTO country (country_name) VALUES
('Kenya'),
('United Kingdom'),
('United States'),
('Germany'),
('France');


INSERT INTO address (town, country_code, country_id) VALUES
('Nairobi', 'KE', 1),
('Mombasa', 'KE', 1),
('London', 'UK', 2),
('New York', 'US', 3),
('Berlin', 'DE', 4);


INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO shipping_method (method_name, shipping_cost, estimated_days) VALUES
('Standard', 5.00, 5),
('Express', 10.00, 2),
('Overnight', 20.00, 1),
('Pickup', 0.00, 0),
('Drone Delivery', 15.00, 1);


INSERT INTO order_status (status_name) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled');


INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id, total_amount) VALUES
(1, '2024-12-01', 1, 1, 15.99),
(2, '2024-12-05', 2, 3, 12.99),
(3, '2024-12-10', 3, 4, 9.99),
(4, '2024-12-12', 4, 2, 17.49),
(5, '2024-12-20', 5, 5, 22.95);


INSERT INTO order_line (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 15.99),
(2, 2, 1, 12.99),
(3, 3, 1, 9.99),
(4, 4, 1, 17.49),
(5, 5, 1, 22.95);


INSERT INTO order_history (order_id, status_id, change_date) VALUES
(1, 1, '2024-12-01'),
(2, 3, '2024-12-06'),
(3, 4, '2024-12-11'),
(4, 2, '2024-12-13'),
(5, 5, '2024-12-21');



-- Retrieves all books with their respective authors, publisher names, and language
SELECT 
    b.title,
    b.ISBN,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    p.name AS publisher_name,
    bl.language_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_language bl ON b.language_id = bl.language_id;



-- Retrieves customers along with their address town, country and address status
SELECT 
    c.first_name,
    c.last_name,
    a.town,
    ct.country_name,
    ast.address_status_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country ct ON a.country_id = ct.country_id
JOIN address_status ast ON ca.address_status_id = ast.address_status_id;


-- Shows all orders placed by customer with ID = 1
SELECT 
    co.order_id,
    co.order_date,
    sm.method_name AS shipping_method,
    os.status_name AS order_status,
    co.total_amount
FROM cust_order co
JOIN shipping_method sm ON co.shipping_method_id = sm.shipping_method_id
JOIN order_status os ON co.status_id = os.status_id
WHERE co.customer_id = 1;


-- Shows which books were purchased in order ID = 1
SELECT 
    ol.order_id,
    b.title,
    ol.quantity,
    ol.unit_price,
    (ol.quantity * ol.unit_price) AS total_price
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
WHERE ol.order_id = 1;


-- Tracks the history of status changes for order ID = 1
SELECT 
    oh.order_id,
    os.status_name,
    oh.change_date
FROM order_history oh
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.order_id = 1
ORDER BY oh.change_date ASC;


-- Retrieves the 5 most expensive books in the store
SELECT 
    title,
    price
FROM book
ORDER BY price DESC
LIMIT 5;


-- Retrieves the 5 most expensive books in the store
SELECT 
    title,
    price
FROM book
ORDER BY price DESC
LIMIT 5;


-- Shows all shipping methods with cost and estimated delivery time
SELECT 
    method_name,
    shipping_cost,
    estimated_days
FROM shipping_method;



-- Shows how many customers are in each country
SELECT 
    ct.country_name,
    COUNT(DISTINCT ca.customer_id) AS num_customers
FROM country ct
JOIN address a ON ct.country_id = a.country_id
JOIN customer_address ca ON ca.address_id = a.address_id
GROUP BY ct.country_name;



-- Lists all books that were published before the year 2000
SELECT 
    title,
    publication_year
FROM book
WHERE publication_year < 2000;



-- Searches for books containing the word 'Harry' in their title
SELECT 
    title,
    price
FROM book
WHERE title LIKE '%Harry%';
