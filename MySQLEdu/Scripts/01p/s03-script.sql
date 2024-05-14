/* Code for 01p/s03-scripts*/
/*Creating a view */

/*Creating a parent table*/
-- Create table for employees
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT
);

-- Insert sample data into the employees table
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, department, job_title, salary, manager_id)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-15', 'Engineering', 'Software Engineer', 80000.00, NULL),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '2018-05-20', 'Marketing', 'Marketing Manager', 90000.00, NULL),
('Alice', 'Johnson', 'alice.johnson@example.com', '5551112222', '2019-10-10', 'Engineering', 'Senior Software Engineer', 100000.00, 1),
('Bob', 'Brown', 'bob.brown@example.com', '1112223333', '2020-03-01', 'Human Resources', 'HR Coordinator', 60000.00, 2),
('Emily', 'Wilson', 'emily.wilson@example.com', '4445556666', '2017-12-05', 'Engineering', 'Software Engineer', 85000.00, 1),
('Michael', 'Davis', 'michael.davis@example.com', '7778889999', '2016-08-15', 'Sales', 'Sales Manager', 110000.00, 5),
('Samantha', 'Clark', 'samantha.clark@example.com', '3334445555', '2018-04-20', 'Marketing', 'Marketing Specialist', 75000.00, 2),
('David', 'Martinez', 'david.martinez@example.com', '9990001111', '2019-09-10', 'Engineering', 'Senior Software Engineer', 105000.00, 1),
('Emma', 'Anderson', 'emma.anderson@example.com', '6667778888', '2020-07-01', 'Human Resources', 'HR Manager', 95000.00, 4),
('James', 'Lee', 'james.lee@example.com', '2223334444', '2018-02-15', 'Sales', 'Sales Representative', 70000.00, 6),
('Sarah', 'Adams', 'sarah.adams@example.com', '1234567890', '2019-08-20', 'Engineering', 'Software Engineer', 82000.00, 3),
('Michaela', 'Robinson', 'michaela.robinson@example.com', '9876543210', '2020-04-15', 'Marketing', 'Marketing Coordinator', 70000.00, 2),
('Daniel', 'Thompson', 'daniel.thompson@example.com', '5551112222', '2018-12-10', 'Engineering', 'Junior Software Engineer', 65000.00, 3),
('Olivia', 'Scott', 'olivia.scott@example.com', '1112223333', '2017-11-05', 'Human Resources', 'HR Assistant', 55000.00, 4),
('Matthew', 'Evans', 'matthew.evans@example.com', '4445556666', '2019-06-01', 'Sales', 'Sales Representative', 72000.00, 6),
('Ella', 'Baker', 'ella.baker@example.com', '7778889999', '2020-01-10', 'Engineering', 'Software Engineer', 80000.00, 3),
('Noah', 'Garcia', 'noah.garcia@example.com', '3334445555', '2018-09-20', 'Marketing', 'Marketing Specialist', 75000.00, 2),
('Mia', 'Martinez', 'mia.martinez@example.com', '9990001111', '2021-02-15', 'Engineering', 'Senior Software Engineer', 110000.00, 1),
('William', 'Carter', 'william.carter@example.com', '6667778888', '2019-04-01', 'Human Resources', 'HR Coordinator', 60000.00, 4),
('Ava', 'Rivera', 'ava.rivera@example.com', '2223334444', '2017-07-15', 'Sales', 'Sales Manager', 105000.00, 5),
('Liam', 'Perez', 'liam.perez@example.com', '5556667777', '2018-03-10', 'Engineering', 'Senior Software Engineer', 100000.00, 1),
('Sophia', 'Gonzalez', 'sophia.gonzalez@example.com', '7778889999', '2020-05-20', 'Marketing', 'Marketing Coordinator', 70000.00, 2),
('Benjamin', 'Hernandez', 'benjamin.hernandez@example.com', '3334445555', '2019-01-10', 'Engineering', 'Software Engineer', 85000.00, 3),
('Charlotte', 'Smith', 'charlotte.smith@example.com', '9990001111', '2016-08-01', 'Human Resources', 'HR Manager', 95000.00, 4),
('Jacob', 'Lee', 'jacob.lee@example.com', '2223334444', '2021-04-15', 'Sales', 'Sales Representative', 70000.00, 10);



select * from employees e;

/*Creating a view*/
CREATE VIEW engineering_employees AS
SELECT first_name, last_name, email, phone_number, hire_date, department, job_title
FROM employees
WHERE department = 'Engineering';

select * from engineering_employees;
