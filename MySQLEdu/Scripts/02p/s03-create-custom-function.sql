/* s04-create-procedure*/

-- DROP TABLE IF EXISTS customers;
-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- DROP TABLE IF EXISTS orders;
-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Lee', 'charlie@example.com');

-- Insert data into orders table
INSERT INTO orders (order_date, customer_id, amount) VALUES
('2024-05-01', 1, 100.50),
('2024-05-02', 1, 200.75),
('2024-05-03', 2, 150.00),
('2024-05-04', 3, 300.00);


-- Creating procedure
CREATE PROCEDURE add_new_order(
    IN order_date DATE, 
    IN customer_id INT, 
    IN order_amount DECIMAL(10, 2)
)
BEGIN
    -- Check if the order_date is less than the current date
    IF order_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order date cannot be in the past.';
    END IF;
    
    -- Check if the order_amount is less than or equal to 0
    IF order_amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order amount must be greater than 0.';
    END IF;
    
    -- Insert a new order for the customer
    INSERT INTO orders (order_date, customer_id, amount)
    VALUES (order_date, customer_id, order_amount);
END

CALL add_new_order('2024-05-18', 1, 250.00);
select * from orders;
CALL add_new_order('2024-05-10', 1, 250.00);
select * from orders;

