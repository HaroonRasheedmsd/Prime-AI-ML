-- Q - 1 : Create a database for your university(uni)
CREATE DATABASE IF NOT EXISTS uni;
USE uni;

-- create a table 
CREATE TABLE teacher (
	id int,
    name VARCHAR(30) NOT NULL,
    subject VARCHAR(40),
    salary INT DEFAULT 50000,
	PRIMARY KEY(id)
);

-- insert data
INSERT INTO teacher
(id, name, subject, salary)
VALUES 
(23, "ajay", "math", 50000),
(47, "Ali", "english", 60000),
(18, "Khan", "chemistry", 45000),
(9, "bob", "physics", 75000);

SELECT * FROM teacher;

-- Q - 2: Perform operation on the above
-- 1. select teachers whose salary is more than 55K
SELECT * from teacher
WHERE salary > 55000;

-- 2. Rename the salary column of teacher table to ctc
ALTER table teacher
change column salary ctc int;

select * from teacher;

-- 3. Update salary(ctc) of teahcer by giving them an increment of 25%
UPDATE teacher
set ctc = ctc * 1.25;
set sql_safe_updates = 0;

-- 4. ADD new column for teacher called city and default value must be GUARgaon
ALTER table teacher
add column city varchar(30) default "guargaon";

-- 5. delete the salary(ctc) column for teacher table
alter table teacher
drop column ctc;


-- Q - 3 : create table to store info about student 
CREATE TABLE student(
	roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(30),
    marks INT DEFAULT 100
);

-- INSERT DATA
INSERT into student
(roll_no, name, city, marks)
values
(101, "khan", "lahore", 76),
(108, "bob", "mumbai", 65),
(124, "casey", "new york", 89),
(112, "duke", "pune", 80);

-- select all students who scored 75+ 
SELECT * from student
where marks > 75;

-- finde name of all cities where students are from
SELECT DISTINCT city from student;

-- find the max marks for students from each city 
SELECT city, max(marks) 
from student
group by city;

-- select avg of class
select avg(marks)
from student;

-- add new column grade, assign grade such that: marks > 80, grade = O, marks 70-80, grade=A, marks 60-70, grade = B;
ALTER TABLE student 
add column grade VARCHAR(2);

SELECT * FROM student;

-- now to add data
UPDATE student
SET grade = CASE
	WHEN marks > 80 then 'O' 
    WHEN marks >= 70 and marks <= 80 THEN 'A'
    WHEN marks >=60 and marks < 70 THEN 'B'
    else 'F'
END;



-- Assignment 
-- Create the Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
-- insert data
INSERT INTO Employee (EmpID, FirstName, LastName, Department, Salary, HireDate) VALUES
(101, 'Alice', 'Johnson', 'IT', 6500.00, '2020-03-15'),
(102, 'Mark', 'Rivera', 'HR', 4800.00, '2019-07-22'),
(103, 'Sophia', 'Lee', 'Finance', 7200.00, '2021-01-10'),
(104, 'Daniel', 'Kim', 'IT', 5800.00, '2018-11-05'),
(105, 'Emma', 'Brown', 'Marketing', 5300.00, '2022-04-18'),
(106, 'Liam', 'Patel', 'Finance', 6900.00, '2020-09-29'),
(107, 'Olivia', 'Garcia', 'HR', 4600.00, '2017-06-30'),
(108, 'Noah', 'Thompson', 'IT', 7500.00, '2023-02-12'),
(109, 'Ava', 'Martinez', 'Marketing', 5100.00, '2019-12-02'),
(110, 'Ethan', 'Davis', 'Finance', 8000.00, '2016-05-14');

-- Q -1 . DISPLAY ALL
select * from Employee;

-- Q - 2: list only firstname, lastname, and salary of employee
SELECT FirstName, LastName, Salary 
FROM Employee;
 
-- Q - 3: show all employees who work in IT department 
SELECT * from Employee
where department = 'IT';

-- Q - 4: retrieve employees with a salary greater than 6000
SELECT * FROM Employee
where Salary > 6000;

-- Q -5 list all employees ordered by HIREDATE from newest to oldest 
SELECT * FROM Employee
ORDER BY HireDate DESC;

-- Q - 6: show list of unique departments present in the table
SELECT DISTINCT Department FROM Employee;

-- Q - 7: Find Employees whos first name starts with "A"
SELECT * from Employee where FirstName like 'A%';

-- Q - 8: show employees whose salaries are between 4000 and 7000
SELECT * FROM Employee
WHERE Salary BETWEEN 4000 AND 7000;

-- Q - 9: Find the average salary of all employees 
SELECT avg(Salary)
FROM Employee;

-- Q - 10: List each department along with the number of employees, but only include departments
-- with more than 2 employees.
SELECT Department, count(EmpID)
from Employee
GROUP BY Department
HAVING COUNT(EmpID) > 2;

