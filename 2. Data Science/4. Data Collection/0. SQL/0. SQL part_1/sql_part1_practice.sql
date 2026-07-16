-- To create database always use =>If NOT EXISTS this will give warning only that there is already created with same name
CREATE DATABASE IF NOT EXISTS college;

-- an other database to practice deletion of database
CREATE DATABASE IF NOT EXISTS teacher;

-- To delete database use drop
DROP DATABASE IF EXISTS teacher;

-- To use database
USE college;

-- To create Table
CREATE TABLE student(
	rollno INT,
    name VARCHAR(30),
    age INT
);

-- To insert data in table student
INSERT INTO student 
VALUES
(101, "adam", 12),
(102, "bob", 14);

-- To show data in table
SELECT * FROM student;

-- To show Databases
SHOW DATABASES;

-- TO show Tables
SHOW TABLES;

-- Table queries: create, insert, update(values), alter(add or update columns), truncate(to clear all data), delete(delete table) 

-- Constraints: Rules for data in table
-- 1. NOT NULL => columns cannot have null value; 2. UNIQUE => all values in a column are different
-- 3. DEFAULT => sets the default value of a column like: salary int default 25000;
-- 4. CHECK => it can limit the values allowed in a column i.e.: CONSTRAINT age_check CHECK (age >= 13)

-- e.g.
CREATE DATABASE IF NOT EXISTS instagram;
USE instagram;
CREATE TABLE user(
	id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT DEFAULT 0,
    CONSTRAINT CHECK (age >=13),
    PRIMARY KEY(id)
);

-- Primary key: makes column unique & not null but used only for one 
-- two wasy: i. write PRIMARY KEY with column name;  or ii. write in the way like: PRIMARY KEY(id) at last line of table

-- Foreign key: prevent actions that would destroy links between tables: ther can be multiple FKs, & may duplicate or null values
-- FK is PK in other table and create links between tables; may be one or more column e.g: FOREIGN KEY(cust_id) refrences customer(id)

CREATE TABLE post (
	id INT,
    content VARCHAR(100),
    user_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Insert into tables: 
INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(1, 14, "Haroom", "hr123@gail.com", 500, 1),
(2, 15, "rasheed", "r123@gmail.com", 5000, 1),
(3, 16, "khan", "khan@gmail.com", 343443, 1);

INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(4, 16, "khan", "jan@gmail.com", 343443, 1);

SELECT id, name, email FROM user;
select * from user;
SELECT DISTINCT age FROM USER;

-- Where Cluase: To define some conditions 
SELECT * 
FROM user
WHERE  followers >= 200; 

SELECT id, name
FROM user
WHERE followers >=200;

-- Operators with Where clause: 
-- 1. Arithematic operators: +, -, *, /, %, 
SELECT id, age
FROM user
WHERE age + 1 =17;

-- 2. Comparision operators: =, !=, <, >, <=, >=
SELECT id, name
FROM user
WHERE followers >=200;

-- 3. Logical Operators: AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
SELECT id, name
FROM user
WHERE age > 15 AND followers >=200;

SELECT id, name
FROM user
WHERE followers BETWEEN 300 AND 500;

SELECT id, name
FROM user
WHERE email IN ("hr123gmail.com", "hr3gmail.com", "abc@gmail.com");

SELECT id, name
FROM user
WHERE email NOT IN ("hr123gmail.com", "hr3gmail.com", "abc@gmail.com");

-- Bitwise operator: help in bit manipulation. &(Bitwise AND), |(Bitwise OR)

-- Limit Cluase: use to limit the returened data like there are 1000 rows that can be returned based on condition but we need only 5
-- in bellow query 4 entries will return but i need 2 only for that i will use limit clause
SELECT id, name
FROM user
WHERE age >= 14
LIMIT 2;

-- will print all users id and name but i need only 3 for that i used limit clause
SELECT id, name
FROM user
LIMIT 3;

-- ORDER BY Clause: is used to sort data in both asc or desc order 
SELECT id, name, followers
FROM user
ORDER BY followers ASC; -- also if we don't write ASC then bydefault it is in ascending ordered

SELECT id, name, followers
FROM user
ORDER BY followers DESC;

-- Aggregate Functions: built in function that calculate values and gives only one answer 
-- count(), max(), avg(), min(), sum()
SELECT MAX(age)
from user;

SELECT COUNT(followers)
FROM user
WHERE followers >=600;

-- Group by Clause: it is used to group rows of same values and then give count of that like there 3 students of 14 age and 
-- 4 students of 16 age etc. also others 
-- generally we use group by clause with some aggregation functions
SELECT age, count(id)
from user 
Group by age;

SELECT age, max(followers)
from user 
Group by age;

-- Having clause: similar to where clasue that apply condition on rows, but Having clasue apply condition on group by data means after
-- group by clause so grouping is necessary for Having clause
SELECT age, max(followers)
from user 
Group by age
Having max(followers) >= 600;

-- General Order of queries
-- 1. Select column(s)
-- 2. from table_name
-- 3. Where condition
-- 4. Group by column(s)
-- 5. Having condition 
-- 6. Order by column(s) ASC ( or DESC)

-- Table queries 
-- Update values of table 
UPDATE user
set followers = 600
where age = 16;

SET SQL_SAFE_UPDATES = 0; -- This query remove the error as SQL don't allow to update values for that we change safe mode from 1 to 0

-- Delete existing rows 
delete from user
where age = 14;

-- Alter is used to change the table schema like change column name, data types, constraints, to add or delete new column
-- 1. add column 
ALTER table user
add column city VARCHAR(25) DEFAULT "Lahore"; 

-- 2. delete column 
ALTER table user
drop column age;

-- 3. rename complete table
ALTER TABLE user
RENAME TO instauser;

-- 4. rename column 
ALTER TABLE instauser
change COLUMN followers subs int default 0; 
select * from instauser;

-- 5. Modify column name or datatype or constraints
alter table user
modify subs int default 5;

-- 6. Truncate: this will only delete table data completely but drop delete  complete table
-- also if any dependent table like it PK is FK in other table for that we do two thing delete other table  or change FK constraint in other table
truncate table post;