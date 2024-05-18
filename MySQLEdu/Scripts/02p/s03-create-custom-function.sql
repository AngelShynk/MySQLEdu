/* s03-create-custom-function*/

-- 1

CREATE FUNCTION reverse_string(input_string VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE output_string VARCHAR(255);
    SET output_string = REVERSE(input_string);
    RETURN output_string;
END;

select reverse_string("Some string!") as reversed_str;

/*
 Adding the DETERMINISTIC keyword indicates that 
 the function always produces the same result
 for the same input and has no side effects. 
 */


-- 2
-- DROP TABLE IF EXISTS orders_for_functions;
CREATE TABLE orders_for_functions (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    comment VARCHAR(50)
);

-- Inserting values into table
INSERT INTO orders_for_functions (order_id, customer_id, order_date, total_amount, comment)
VALUES
    (1, 101, '2024-01-15', 150.75, NULL),
    (2, 102, '2024-01-16', 200.00, 'Good order!'),
    (3, 103, '2024-01-17', 320.40, NULL),
    (4, 104, '2024-01-18', 50.25, 'Delivery'),
    (5, 105, '2024-01-19', 75.10, 'Fragile');

SELECT * FROM orders_for_functions;

-- DROP FUNCTION get_comment_by_order_id;


CREATE FUNCTION get_comment_by_order_id(_order_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE COMMENT_FOUND VARCHAR(255) DEFAULT 'NO COMMENTS.';
    
    -- Handling potential SQL errors using a CONTINUE HANDLER
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET COMMENT_FOUND = 'NO COMMENTS.';
    
    -- Select the comment into the variable, if not found the handler will set it to 'NO COMMENTS.'
    SELECT COALESCE(COMMENT, 'NO COMMENTS.') INTO COMMENT_FOUND
    FROM ORDERS_FOR_FUNCTIONS
    WHERE order_id = _order_id
    LIMIT 1;  -- To ensure only one comment is retrieved if there are multiple

    RETURN COMMENT_FOUND;
END;


/*
Explanation
1. CONTINUE HANDLER: This handler catches the case where no rows are found and ensures COMMENT_FOUND is set to 'NO COMMENTS.'
2. LIMIT 1: Ensures only one comment is retrieved even if there are multiple entries for the same order ID.
 */

SELECT get_comment_by_order_id(1);
SELECT get_comment_by_order_id(10);
SELECT order_id, get_comment_by_order_id(order_id) AS order_comment FROM orders_for_functions;




