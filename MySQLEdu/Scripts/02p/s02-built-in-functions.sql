/* s01-built-in-functions */
-- Creating table
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


-- Aggregate Functions

-- COUNT(): Returns the number of rows.
SELECT COUNT(*) FROM orders;

-- SUM(): Returns the sum of a numeric column.
SELECT SUM(total_amount) FROM orders;

-- AVG(): Returns the average value of a numeric column.
SELECT AVG(total_amount) FROM orders;

-- MAX(): Returns the maximum value of a column.
SELECT MAX(total_amount) FROM orders;

-- MIN(): Returns the minimum value of a column.
SELECT MIN(total_amount) FROM orders;


-- String Functions

-- CONCAT(): Concatenates two or more strings.
SELECT CONCAT('Order ID: ', order_id) FROM orders;

-- UPPER(): Converts a string to uppercase.
SELECT UPPER('hello') AS uppercase_hello;

-- LOWER(): Converts a string to lowercase.
SELECT LOWER('HELLO') AS lowercase_hello;

-- SUBSTRING(): Extracts a substring from a string.
SELECT SUBSTRING('Hello World', 1, 5) AS sub;


-- Date Functions

-- CURRENT_DATE(): Returns the current date.
SELECT CURRENT_DATE() AS today;

-- DATE_ADD(): Adds a time/date interval to a date.
SELECT DATE_ADD('2024-01-15', INTERVAL 7 DAY) AS next_week;

-- DATEDIFF(): Returns the difference between two dates.
SELECT DATEDIFF('2024-01-19', '2024-01-15') AS days_difference;

-- DATE_FORMAT(): format a date using the custom function you've defined:
SELECT DATE_FORMAT('2024-05-18', '%Y-%m-%d') AS formatted_date;
SELECT DATE_FORMAT('2024-05-18', '%Y') AS formatted_date;


-- Mathematical Functions

-- ROUND(): Rounds a number to a specified number of decimal places.
SELECT ROUND(123.4567, 2) AS rounded_number;

-- CEIL(): Returns the smallest integer greater than or equal to a number.
SELECT CEIL(123.45) AS ceiling_number;

-- FLOOR(): Returns the largest integer less than or equal to a number.
SELECT FLOOR(123.45) AS floor_number;


-- Dealing with NULL

-- ISNULL(): Returns 1 if value is null, returns 1 if value is not null.
SELECT ISNULL(NULL) AS is_null_value;
SELECT ISNULL(1) AS is_null_value;

-- IFNULL(): Return the specified value IF the expression is NULL, otherwise return the expression; IFNULL(expression, alt_value)
SELECT IFNULL(NULL, "Some text");
SELECT IFNULL(order_date, "Some text") FROM orders;

-- COALESCE(): Return the first non-null value in a list.
SELECT COALESCE(NULL, NULL, NULL, 1, NULL, 2);


-- Casing types

-- CAST(): Converts a value (of any type) into the specified datatype.
SELECT CAST("2017-08-29" AS DATE);
SELECT CAST(order_id AS CHAR(10)) AS order_id_as_varchar FROM orders;








