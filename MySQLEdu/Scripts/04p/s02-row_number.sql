-- ROW_NUMBER()

USE practice;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    uuid VARCHAR(36),
    insert_date DATETIME,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    PRIMARY KEY (uuid, insert_date)
);


INSERT INTO employees (uuid, insert_date, first_name, last_name, department, salary)
VALUES
((SELECT UUID()), CURRENT_TIMESTAMP(), 'John', 'Doe', 'Engineering', 60000.00),
((SELECT UUID()), CURRENT_TIMESTAMP(), 'Jane', 'Smith', 'Marketing', 55000.00),
((SELECT UUID()), CURRENT_TIMESTAMP(), 'Alice', 'Johnson', 'Engineering', 70000.00),
((SELECT UUID()), CURRENT_TIMESTAMP(), 'Bob', 'Brown', 'Sales', 45000.00),
((SELECT UUID()), CURRENT_TIMESTAMP(), 'Charlie', 'Davis', 'Engineering', 65000.00)
;


SELECT * FROM employees;


/*

PARTITION BY department: Divides the result set into partitions for each department.

ORDER BY salary DESC: Orders rows within each partition by salary in descending order.

ROW_NUMBER(): Assigns a unique row number to each row within the partition.

*/

SELECT
    uuid,
    first_name,
    last_name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;


-- Inserting duplicates
INSERT INTO employees (uuid, insert_date, first_name, last_name, department, salary)
VALUES
('1a55b1ac-2756-11ef-a066-2da1a34c9401', CURRENT_TIMESTAMP(), 'John', 'Doe', 'Engineering', 60000.00),
('1a55becc-2756-11ef-a066-2da1a34c9401', CURRENT_TIMESTAMP(), 'Jane', 'Smith', 'Marketing', 55000.00);



-- Deleting duplicates
WITH CTE AS (
    SELECT 
        uuid,
        insert_date,
        ROW_NUMBER() OVER (PARTITION BY first_name, last_name, department, salary ORDER BY insert_date) AS row_num
    FROM employees
)
DELETE FROM employees
WHERE (uuid, insert_date) IN (
    SELECT uuid, insert_date
    FROM CTE
    WHERE row_num > 1
);

