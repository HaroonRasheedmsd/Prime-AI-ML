-- Transaction: a series of operations considered to be like a single task. So this set of operation is called Transaction
-- so this series of operation must satisfy some condition called ACID Properties
-- 1. Atomicity: All statements must be succeed or none succeed 
-- 2. Consistency: Data moves from one valid state to another 
-- 3. Isolation: Paralled transactions don't interfere
-- 4. Durability: Committed data is permanently saved

-- How Transaction work ? 
-- so we start transaction , then some series of operation to be perform, then our transaction ended and then we commit changes means
-- shows that transaction is completed also if not commited then we rollback which shows to be undo the changes happened in the 
-- series of operations.

-- MySQL treat a single statement as a transaction and apply automcommit. but sometime we don't need to commit every statement
-- we need a complete set of statement to be done then we do commit manually for that we have to close autocommit.

-- How to do Transaction ?
-- 1. Disable autocommit. first check the situation for autocommit.
SELECT @@autocommit; -- if automcommit = 1. then we have to close first autcommit for transaction like
SET autocommit = 0; -- this close the autocommit. but to enable: set autocommit = 1;
SELECT @@autocommit; 
 
-- 2. Now create a transaction for that we have to first create database if not and then table 
CREATE DATABASE prime;
USE prime;

CREATE TABLE accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	balance DECIMAL(10, 2)
);

INSERT INTO accounts ( name, balance) VALUES
('Adam', 500.00),
('Haroon', 10000.00);

select * from accounts;

-- now transaction queries
START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
COMMIT;

-- now rollback quesries. this is used to undo the changes, ALSO rollback only undo uncommited commonds if commit then no rollback
START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
ROLLBACK;

-- Savepoint: these are basically to divide the set of operation and make points between them and then we treat those savepoint as 
-- a milestone where from savepoint to another is of same set operation and so one. so basically to divide an entire set of operations
-- into multiple set of operation.

START TRANSACTION;
UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;

UPDATE accounts SET balance = balance + 10 WHERE id = 1; -- if any error occure we rollback one step behind only
ROLLBACK TO after_wallet_topup;
COMMIT;


-- JOINs: to combine rows from two or more tables based on related column between them
CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customer VALUES 
(1, 'Alice', 'Moni'),
(2, 'Bob', 'Delhi'),
(3, 'Haroon', 'Lahore'),
(4, 'Ali', 'Peshawar');

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT 
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM orders;
SELECT * FROM customer;

-- inner join : where in all table only commone rows are taken
SELECT * 
FROM customer c 
INNER JOIN orders o
ON c.customer_id = o.customer_id;
 
-- for specif columns
SELECT c.customer_id, o.order_id, c.name
FROM customer c 
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Left join : here left table is complete taken but only common  rows from right is taken for other NULL values come
SELECT *
FROM customer c 
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- right join: here right table is complete taken but only common  rows from left is taken for other NULL values come 
SELECT *
FROM customer c 
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- outer join: it is Union of both Left and Right join 
SELECT *
FROM customer c 
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT *
FROM customer c 
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
 
-- cross join: it's done like from one table take one row and combine with all rows of other and then take an other and 
-- do same for that in this way both tables are combined
SELECT * 
FROM customer
CROSS JOIN orders;

-- self join: it is like innner join but the table is joined with itself
SELECT * 
FROM customer as A
JOIN customer as B
ON A.customer_id = B.customer_id;

-- Practice problem: 
-- write SQL command to display the exclusive joins: left and right exclusive join

-- left exclusve join
SELECT * 
FROM customer as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- right exclusive join is opposite of left exclusive join
SELECT * 
FROM customer as c
RIGHT JOIN orders as o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- Sub Queries: query within a quiry. also called Inner query, Nested query; So it involves two select statements.
SELECT * 
FROM orders
WHERE amount >(
	SELECT AVG(amount)
    FROM orders
);

SELECT name,
	(
		SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
	) AS order_count
FROM customer c;

SELECT 
	summary.customer_id,
    summary.avg_amount
FROM
	(
		SELECT
			customer_id,
            AVG(amount) as avg_amount
		FROM orders
        GROUP BY customer_id
	) as summary;


-- View in SQL
-- View is a virtual table based on the result-set of an SQL statment. mean like we don't want to
-- show password to viewer for that from real table we create virtual table so they can query that. 
-- also a view always show up-to-date data. the database engine recreates the view everytime
-- a user queries it: Properties: no data stored physically except materialized(a type of view) view 

CREATE VIEW view1 AS
SELECT customer_id, name FROM customer;

SELECT * FROM view1;

-- can create from multiple tables using join
CREATE VIEW view2 AS
SELECT c.customer_id, c.name, o.order_id
FROM customer c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

Select * from view2;

-- we can also drop our view like
DROP VIEW view1;

-- Index in SQL
-- Index are special database objects that make data retrieval faster like PK is default index

CREATE INDEX idx_name ON customer(customer_id);
SHOW INDEX FROM customer;

-- so how to use 
-- here we will not find the difference but when data become massive there the query will get faster
  
-- Composit index or multi column index
CREATE INDEX idx1 ON customer(customer_id, name);

-- also we can drop like
DROP INDEX idx1 ON customer;

-- Draw backs : as Select (read) query can be faster but Update or delete (write) query make slower
select database();
-- Stored procedures: Predefined set of SQL Statements that you can save in the database and 
-- execute whenever needed

DELIMITER %%
CREATE PROCEDURE checks_balance(IN acc_id INT)
BEGIN
	SELECT balance 
    FROM accounts
    WHERE id = acc_id;
END %%
DELIMITER ;

-- Call the procedure 
CALL checks_balance(1);
select * from accounts;
drop procedure check_balance;

DELIMITER %%
CREATE PROCEDURE check_balance(IN acc_id INT, OUT bal DECIMAL(10, 2))
BEGIN
	SELECT balance INTO bal
    FROM accounts
    WHERE id = acc_id;
END %%
DELIMITER ;

CALL check_balance(1, @balance);
SELECT @balance;