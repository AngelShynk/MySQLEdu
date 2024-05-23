/* How to read execution plan
 * Example from - https://medium.com/@krishnaraj/the-secrets-of-mysql-query-execution-plans-b270eb091e8e
 */

USE PRACTICE;

CREATE TABLE payments_1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    name VARCHAR(100) NOT NULL
);

/*Executing python script (inserting random values)*/

select count(*) from payments_1;

/*
count(*)|
--------+
 1000000|
*/

/*Executing python script (inserting 'aa' into name)*/

select count(*) from payments_1;

/*
count(*)|
--------+
 2000000|
*/

CREATE INDEX idx_payment_1_name ON payments_1 (name);

explain analyze select * from payments where name = 'aa';
/*

EXPLAIN                                                                                                                       |
------------------------------------------------------------------------------------------------------------------------------+
-> Index lookup on payments using idx_payment_name (name='aa')  (cost=1.1 rows=1) (actual time=0.0457..0.0457 rows=0 loops=1)¶|

*/

ANALYZE TABLE payments_1;

/*
 
Table              |Op     |Msg_type|Msg_text|
-------------------+-------+--------+--------+
practice.payments_1|analyze|status  |OK      |
*/

explain analyze select name from payments where name = 'aa';

explain analyze select name from payments_1 IGNORE INDEX (idx_payment_1_name) where name = 'aa';
/*
 EXPLAIN                                                                                                                                                                                                        |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Filter: (payments_1.`name` = 'aa')  (cost=301012 rows=3.16) (actual time=187..514 rows=2e+6 loops=1)¶    -> Table scan on payments_1  (cost=301012 rows=2.98e+6) (actual time=0.215..386 rows=3e+6 loops=1)¶|
 */

/*Executing python script (inserting 'aa' into name MANY TIMES)*/

SHOW VARIABLES LIKE 'transaction_isolation';

/*
 Variable_name        |Value          |
---------------------+---------------+
transaction_isolation|REPEATABLE-READ|
 */

explain analyze select name from payments where name = 'aa';

