/*
Table

1. Create table user_profiles
+-------------+--------------+---------+
|   Field     |    Type      |  Key    |
+-------------+--------------+---------+
|  user_id    | VARCHAR(36)  | PRIMARY |
| first_name  | VARCHAR(50)  |         |
| last_name   | VARCHAR(50)  |         |
|    email    | VARCHAR(100) |         |
|phone_number | VARCHAR(20)  |         |
| birth_date  | DATE         |         |
|  address    | VARCHAR(255) |         |
|    city     | VARCHAR(100) |         |
|  country    | VARCHAR(100) |         |
| occupation  | VARCHAR(100) |         |
+-------------+--------------+---------+


2. Add comment on table
3. Add comment on each column
4. Insert some data into table user_profiles:

VALUES 
('9f1947b9-dc78-4f59-a781-5a5e4b22ee52', 'John', 'Doe', 'john.doe@example.com', '1234567890', '1990-01-01', '123 Main Street', 'New York', 'USA', 'Software Engineer'),
('c86b6238-f634-4ff6-9489-7edfebb89732', 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '1995-05-15', '456 Oak Avenue', 'Los Angeles', 'USA', 'Data Analyst'),
('a67882af-4d6d-4b3f-894d-f0b19fd0d681', 'Alice', 'Johnson', 'alice.johnson@example.com', '5551112222', '1985-10-20', '789 Elm Road', 'Chicago', 'USA', 'Marketing Manager'),
('7f849b5c-2671-476e-b953-5a79b3c1d50b', 'Bob', 'Brown', 'bob.brown@example.com', '1112223333', '1982-03-12', '321 Cedar Lane', 'Houston', 'USA', 'Financial Analyst'),
('d32a55ed-3105-4979-8d7b-7b5b6e9f5f63', 'Emily', 'Wilson', 'emily.wilson@example.com', '4445556666', '1998-07-08', '567 Pine Street', 'San Francisco', 'USA', 'Graphic Designer'),
('5c18f12e-4fd2-4ae9-8157-20e40d95f82d', 'Michael', 'Davis', 'michael.davis@example.com', '7778889999', '1976-12-25', '987 Birch Avenue', 'Miami', 'USA', 'Sales Manager'),
('8a24f7b9-3f5b-454c-80ac-74b9d3f8ff5d', 'Samantha', 'Clark', 'samantha.clark@example.com', '3334445555', '1993-09-30', '654 Maple Drive', 'Seattle', 'USA', 'HR Coordinator'),
('04e44182-f6b3-48e6-8ab3-0ad1c07af8f3', 'David', 'Martinez', 'david.martinez@example.com', '9990001111', '1980-02-18', '234 Walnut Street', 'Boston', 'USA', 'Product Manager'),
('6e7d92ee-9c0a-4a2e-ae6b-b3998624995f', 'Emma', 'Anderson', 'emma.anderson@example.com', '6667778888', '1987-06-17', '876 Cherry Avenue', 'Austin', 'USA', 'Software Developer'),
('b84a7744-1690-4a2c-bd32-6b16d11f9d51', 'James', 'Lee', 'james.lee@example.com', '2223334444', '1991-11-05', '543 Elm Street', 'Denver', 'USA', 'Data Scientist');

5. Select data from table
6. Add new column status: ENUM('active', 'inactive') NOT NULL DEFAULT 'active'
7. Update some rows: set status = 'inactive'
8. Delete 1 row
9. Truncate table
10. Drop table
 */