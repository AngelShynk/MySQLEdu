/* Code for 01p/s01-tasks*/

USE PRACTICE;


CREATE TABLE user_profiles (
    user_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    birth_date DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    occupation VARCHAR(100)
);
ALTER TABLE user_profiles
COMMENT 'Table containing user profiles information';

ALTER TABLE user_profiles
MODIFY COLUMN user_id VARCHAR(36) COMMENT 'Unique identifier for each user',
MODIFY COLUMN first_name VARCHAR(50) COMMENT 'First name of the user',
MODIFY COLUMN last_name VARCHAR(50) COMMENT 'Last name of the user',
MODIFY COLUMN email VARCHAR(100) COMMENT 'Email address of the user',
MODIFY COLUMN phone_number VARCHAR(20) COMMENT 'Phone number of the user',
MODIFY COLUMN birth_date DATE COMMENT 'Date of birth of the user',
MODIFY COLUMN address VARCHAR(255) COMMENT 'Residential address of the user',
MODIFY COLUMN city VARCHAR(100) COMMENT 'City where the user resides',
MODIFY COLUMN country VARCHAR(100) COMMENT 'Country where the user resides',
MODIFY COLUMN occupation VARCHAR(100) COMMENT 'Occupation of the user';

INSERT INTO user_profiles (user_id, first_name, last_name, email, phone_number, birth_date, address, city, country, occupation) 
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
;

SELECT * FROM user_profiles;

ALTER TABLE user_profiles
ADD COLUMN status ENUM('active', 'inactive') NOT NULL DEFAULT 'active';

UPDATE user_profiles
SET status = 'inactive'
WHERE user_id = '5c18f12e-4fd2-4ae9-8157-20e40d95f82d';

DELETE FROM user_profiles
WHERE user_id = 'b84a7744-1690-4a2c-bd32-6b16d11f9d51';

TRUNCATE TABLE user_profiles;

drop table user_profiles;
