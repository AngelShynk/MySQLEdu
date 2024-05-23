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

/*
Covering Index Scan
A covering index scan (can also be called an index-only scan) is more performant than an index scan.
It happens when the query can retrieve all the required data directly from the index without accessing the actual table data. In this case, the index “covers” all the columns needed for the query.
It avoids disk reads and reduces I/O, making it highly efficient for queries where the necessary data is entirely present in the index.
 */

explain analyze select id, name from payments where name = 'G8Ql1';
/*
EXPLAIN                                                                                                                                   |
------------------------------------------------------------------------------------------------------------------------------------------+
-> Covering index lookup on payments using idx_payment_name (name='G8Ql1')  (cost=1.1 rows=1) (actual time=0.0266..0.0312 rows=1 loops=1)¶|
*/

select count(*) from payments where id > 986032 and id < 996032;

/*
 count(*)|
--------+
    9999|
*/

explain analyze select * from payments where id > 986032 and id < 996032;

/*
EXPLAIN                                                                                                                                                                                                                                                        |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Filter: ((payments.id > 986032) and (payments.id < 996032))  (cost=3825 rows=19104) (actual time=0.0723..10.2 rows=9999 loops=1)¶    -> Index range scan on payments using PRIMARY over (986032 < id < 996032)  (cost=3825 rows=19104) (actual time=0.0679..|
 */


/*
Index Range Scan
It occurs when the query needs to retrieve a range of rows based on a range of values in the indexed column(s)
Typically happens when a query is executed with conditions involved with range operators like >, <, BETWEEN
Based on factors like data distribution, and query cost estimation the query optimizer may decide not to use an index range scan even if it finds an index on the column.
*/

explain analyze select * from payments order by id limit 100;

/*
EXPLAIN                                                                                                                                                                                                 |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Limit: 100 row(s)  (cost=0.0564 rows=100) (actual time=0.16..0.183 rows=100 loops=1)¶    -> Index scan on payments using PRIMARY  (cost=0.0564 rows=100) (actual time=0.159..0.176 rows=100 loops=1)¶|
*/

/*
Clustered Index Scan
It occurs when queries fetch rows based using the primary index. In MySQL, the primary key index is usually implemented as a clustered index.
The clustered index scan is generally efficient because it fetches rows in the order of the clustered index, which reduces the need for extra disk seeks (I/O).
 */

explain analyze select * from payments where name like '%aa%';

/*
 EXPLAIN                                                                                                                                                                                                           |
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-> Filter: (payments.`name` like '%aa%')  (cost=100394 rows=110924) (actual time=1.08..219 rows=4148 loops=1)¶    -> Table scan on payments  (cost=100394 rows=998412) (actual time=0.315..168 rows=1e+6 loops=1)¶|
 */

/*
Full Table Scan
The full table scan is the least performant scan method.
It occurs when the query needs to examine every row in the table to find the required results.
Full table scans are resource-intensive, especially for large tables, and should be avoided.
 */