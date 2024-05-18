/*s01-create-temp-table*/

-- Creating permanent table
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting values into table
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 101, '2024-01-15', 150.75),
    (2, 102, '2024-01-16', 200.00),
    (3, 103, '2024-01-17', 320.40),
    (4, 104, '2024-01-18', 50.25),
    (5, 105, '2024-01-19', 75.10);
   
   
SELECT * FROM orders;

-- Creating temporary table
 CREATE TEMPORARY TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

SELECT * FROM orders;

DROP TABLE orders; /* Or just reconnect */

SELECT * FROM orders;

DROP TABLE orders;