CREATE DATABASE IF NOT EXISTS opt_db;
USE opt_db;

CREATE TABLE IF NOT EXISTS opt_clients (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

CREATE TABLE IF NOT EXISTS opt_products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_category ENUM('Category1', 'Category2', 'Category3', 'Category4', 'Category5') NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS opt_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    client_id CHAR(36),
    product_id INT,
    FOREIGN KEY (client_id) REFERENCES opt_clients(id),
    FOREIGN KEY (product_id) REFERENCES opt_products(product_id)
);

select * from opt_clients;
select * from opt_products;
select * from opt_orders;


-- join example

SELECT 
    o.order_id,
    o.order_date,
    c.id AS client_id,
    c.name AS client_name,
    c.surname AS client_surname,
    c.email AS client_email,
    c.phone AS client_phone,
    c.address AS client_address,
    c.status AS client_status,
    p.product_id,
    p.product_name,
    p.product_category,
    p.description AS product_description
FROM 
    opt_orders o
JOIN 
    opt_clients c ON o.client_id = c.id
JOIN 
    opt_products p ON o.product_id = p.product_id;


 -- Select all clients with no orders
   
   
 select c.*
 from opt_clients as c
 left join opt_orders as o
 on c.id = o.client_id
 where o.client_id is null;



-- CTE

-- Without CTE

SELECT
    (SELECT CONCAT(product_name, ": ", cnt) 
     FROM (SELECT product_name, COUNT(*) AS cnt 
           FROM (SELECT o.order_id, o.order_date, p.product_id, p.product_name
                 FROM opt_orders o
                 JOIN opt_products p ON o.product_id = p.product_id
                 WHERE o.order_date > '2023-01-01') AS sub1
           GROUP BY product_name) AS sub2
     WHERE cnt = (SELECT MIN(cnt) 
                  FROM (SELECT COUNT(*) AS cnt 
                        FROM (SELECT o.order_id, o.order_date, p.product_id, p.product_name
                              FROM opt_orders o
                              JOIN opt_products p ON o.product_id = p.product_id
                              WHERE o.order_date > '2023-01-01') AS sub3
                        GROUP BY product_name) AS sub4) 
     LIMIT 1) AS min_cnt,
    
    (SELECT CONCAT(product_name, ": ", cnt) 
     FROM (SELECT product_name, COUNT(*) AS cnt 
           FROM (SELECT o.order_id, o.order_date, p.product_id, p.product_name
                 FROM opt_orders o
                 JOIN opt_products p ON o.product_id = p.product_id
                 WHERE o.order_date > '2023-01-01') AS sub1
           GROUP BY product_name) AS sub2
     WHERE cnt = (SELECT MAX(cnt) 
                  FROM (SELECT COUNT(*) AS cnt 
                        FROM (SELECT o.order_id, o.order_date, p.product_id, p.product_name
                              FROM opt_orders o
                              JOIN opt_products p ON o.product_id = p.product_id
                              WHERE o.order_date > '2023-01-01') AS sub3
                        GROUP BY product_name) AS sub4) 
     LIMIT 1) AS max_cnt;

    
-- With CTE

with cte as (
	select o.order_id, o.order_date, p.product_id, p.product_name
	from opt_orders  as o
	join opt_products  as p
	on o.product_id = p.product_id
	where o.order_date > '2023-01-01'
)
,

cnt_products as  (
select product_name, count(*) as cnt
from cte
group by product_name
)


select

(select concat(product_name, ": ", cnt) from cnt_products where cnt = (select min(cnt) as min_cnt from cnt_products) limit 1) as min_cnt,
(select concat(product_name, ": ", cnt) from cnt_products where cnt = (select max(cnt) as max_cnt from cnt_products) limit 1) as max_cnt

;

