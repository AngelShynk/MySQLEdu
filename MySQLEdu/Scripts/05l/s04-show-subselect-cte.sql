
/*s04-show-subselect-cte*/

CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (department_name) VALUES ('HR'), ('Finance'), ('Engineering');

INSERT INTO employees (employee_name, department_id, salary) VALUES
('Alice', 1, 60000.00),
('Bob', 2, 70000.00),
('Charlie', 3, 80000.00),
('David', 3, 90000.00),
('Eve', 2, 75000.00);



SELECT employee_name, salary
FROM employees AS e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);



/* CTE */
WITH cte_name AS (
    SELECT query
)
SELECT ...
FROM cte_name;


CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (department_name) VALUES ('HR'), ('Finance'), ('Engineering');

INSERT INTO employees (employee_name, department_id, salary) VALUES
('Alice', 1, 60000.00),
('Bob', 2, 70000.00),
('Charlie', 3, 80000.00),
('David', 3, 90000.00),
('Eve', 2, 75000.00);

WITH AvgSalaries AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, a.avg_salary
FROM AvgSalaries a
JOIN departments d ON a.department_id = d.id
WHERE a.avg_salary > 70000;



