/* How to read execution plan
 * Example from - https://medium.com/@krishnaraj/the-secrets-of-mysql-query-execution-plans-b270eb091e8e
 */

USE PRACTICE;

-- drop table clients;
-- drop table payments_3;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL
);

CREATE TABLE payments_3 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    name VARCHAR(100) NOT NULL,
    client_id INT,
    foreign key(client_id) references clients(id)
);

/*Executing python script*/

select count(*) from clients;

select count(*) from payments_3;

/* Jonin data*/

select c.*, p.*
from clients c
join payments_3 p
on c.id = p.client_id
limit 100;


explain analyze select c.*, p.*
from clients c
join payments_3 p
on c.id = p.client_id
limit 100;

/*
 EXPLAIN                                                                                                                                                                                                                                                        |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Limit: 100 row(s)  (cost=449578 rows=100) (actual time=0.136..0.732 rows=100 loops=1)¶    -> Nested loop inner join  (cost=449578 rows=997442) (actual time=0.135..0.716 rows=100 loops=1)¶        -> Filter: (p.client_id is not null)  (cost=100473 rows=9|
 */

explain analyze select c.*, p.*
from clients c
join payments_3 p
on c.id = p.client_id

/*
-> Nested loop inner join  (cost=449578 rows=997442) (actual time=0.252..1910 rows=1e+6 loops=1)
    -> Filter: (p.client_id is not null)  (cost=100473 rows=997442) (actual time=0.197..198 rows=1e+6 loops=1)
        -> Table scan on p  (cost=100473 rows=997442) (actual time=0.195..161 rows=1e+6 loops=1)
    -> Single-row index lookup on c using PRIMARY (id=p.client_id)  (cost=0.25 rows=1) (actual time=0.0016..0.00162 rows=1 loops=1e+6)

 */

