/* How to read execution plan
 * Example from - https://medium.com/@krishnaraj/the-secrets-of-mysql-query-execution-plans-b270eb091e8e
 */

USE PRACTICE;

CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    name VARCHAR(100) NOT NULL
);

/*Executing python script*/

select count(*) from payments;

# select * from payments;
explain analyze select * from payments

/*
 EXPLAIN                                                                                         |
------------------------------------------------------------------------------------------------+
-> Table scan on payments  (cost=100394 rows=998412) (actual time=0.361..192 rows=1e+6 loops=1)¶|
 */

explain analyze select * from payments where name = 'G8Ql1';

/*
 EXPLAIN   
 ------------------------------------------------------------------------------------------------+                                                                                      |
-> Filter: (payments.`name` = 'G8Ql1')  (cost=100394 rows=99841) (actual time=0.989..193 rows=1 loops=1)
    -> Table scan on payments  (cost=100394 rows=998412) (actual time=0.0768..157 rows=1e+6 loops=1)
 */

CREATE INDEX idx_payment_name ON payments (name);
 
explain analyze select * from payments where name = 'G8Ql1';

/*
EXPLAIN                                                                                                                         |
--------------------------------------------------------------------------------------------------------------------------------+
-> Index lookup on payments using idx_payment_name (name='G8Ql1')  (cost=0.35 rows=1) (actual time=0.502..0.922 rows=1 loops=1)¶|
*/

explain analyze select name from payments where name = 'G8Ql1';

/*
EXPLAIN                                                                                                                                  |
-----------------------------------------------------------------------------------------------------------------------------------------+
-> Covering index lookup on payments using idx_payment_name (name='G8Ql1')  (cost=1.1 rows=1) (actual time=0.0377..0.043 rows=1 loops=1)¶|

*/


