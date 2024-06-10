-- GROUP BY, HAVING


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


SELECT * FROM employees;

INSERT INTO employees (uuid, insert_date, first_name, last_name, department, salary)
VALUES
(UUID(), NOW(), 'John', 'Doe', 'Engineering', 60000.00),
(UUID(), NOW(), 'Jane', 'Smith', 'Marketing', 55000.00),
(UUID(), NOW(), 'Alice', 'Johnson', 'Engineering', 70000.00),
(UUID(), NOW(), 'Bob', 'Brown', 'Sales', 45000.00),
(UUID(), NOW(), 'Charlie', 'Davis', 'Engineering', 65000.00),
(UUID(), NOW(), 'Emma', 'Lee', 'Marketing', 60000.00),
(UUID(), NOW(), 'Michael', 'Wilson', 'Engineering', 75000.00),
(UUID(), NOW(), 'Sarah', 'Jones', 'Sales', 50000.00),
(UUID(), NOW(), 'David', 'Clark', 'Marketing', 62000.00),
(UUID(), NOW(), 'Laura', 'Taylor', 'Engineering', 68000.00),
(UUID(), NOW(), 'John', 'Doe', 'Engineering', 60000.00),
(UUID(), NOW(), 'Jane', 'Smith', 'Marketing', 55000.00),
(UUID(), NOW(), 'Alice', 'Johnson', 'Engineering', 70000.00),
(UUID(), NOW(), 'Bob', 'Brown', 'Sales', 45000.00),
(UUID(), NOW(), 'Charlie', 'Davis', 'Engineering', 65000.00),
(UUID(), NOW(), 'Emma', 'Lee', 'Marketing', 60000.00),
(UUID(), NOW(), 'Michael', 'Wilson', 'Engineering', 75000.00),
(UUID(), NOW(), 'Sarah', 'Jones', 'Sales', 50000.00),
(UUID(), NOW(), 'David', 'Clark', 'Marketing', 62000.00),
(UUID(), NOW(), 'Laura', 'Taylor', 'Engineering', 68000.00),
(UUID(), NOW(), 'John', 'Doe', 'Engineering', 60000.00),
(UUID(), NOW(), 'Jane', 'Smith', 'Marketing', 55000.00),
(UUID(), NOW(), 'Nina', 'Jones', 'Sales', 52000.00);


SELECT department, AVG(salary) AS avg_salary
FROM employees e 
GROUP BY department
;

SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees e 
GROUP BY department
;

SELECT department, FORMAT(ROUND(AVG(salary), 2), 2) AS avg_salary
FROM employees e 
GROUP BY department
;

-- WHERE VS HAVING

SELECT department, FORMAT(ROUND(AVG(salary), 2), 2) AS avg_salary
FROM employees e 
WHERE salary > 50000
GROUP BY department

