/* How to read execution plan
 * Example from - https://medium.com/@krishnaraj/the-secrets-of-mysql-query-execution-plans-b270eb091e8e
 */

USE PRACTICE;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL
);

CREATE TABLE payments_3 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    name VARCHAR(100) NOT NULL,
    client_id INT
    foreign key(client_id) references clients(id)
);

/*Executing python script*/

select count(*) from payments_3;


