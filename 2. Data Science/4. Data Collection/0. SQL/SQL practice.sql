CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

INSERT INTO customers VALUES
(1,'Haroon','Lahore','haroon@gmail.com'),
(2,'Ali','Islamabad','ali@gmail.com'),
(3,'Ahmed','Karachi','ahmed@gmail.com'),
(4,'Sara','Lahore','sara@gmail.com'),
(5,'John','Peshawar','john@gmail.com');

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products VALUES
(101,'Laptop','Electronics',120000,10),
(102,'Phone','Electronics',70000,20),
(103,'Keyboard','Accessories',2500,50),
(104,'Mouse','Accessories',1500,40),
(105,'Monitor','Electronics',35000,15);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,

    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001,1,101,1,'2026-01-10'),
(1002,1,103,2,'2026-02-11'),
(1003,2,102,1,'2026-01-18'),
(1004,3,104,3,'2026-03-01'),
(1005,2,105,1,'2026-04-10'),
(1006,5,101,2,'2026-05-12');

-- Display all customers living in Lahore.
SELECT * 
FROM customers
WHERE city = 'Lahore';

-- Show products whose price is greater than 30,000.
SELECT * 
FROM products
WHERE price > 30000;

-- Show customers whose names start with "A".
SELECT * -- customer_name 
FROM customers
WHERE customer_name LIKE 'A%';

-- Show products whose category is Electronics.
SELECT * 
FROM products
WHERE category = 'Electronics';

-- Display the three most expensive products.
SELECT * 
FROM products 
ORDER BY price DESC 
LIMIT 3;

-- Display the cheapest product
SELECT * 
FROM products 
ORDER BY price ASC 
LIMIT 1;

-- Find the average product price.
SELECT AVG(price)
FROM products;

-- Find total stock available.
SELECT SUM(stock)
FROM products;

-- Find highest priced product.
SELECT MAX(price)
FROM products;

-- Find number of products in each category.
SELECT category,
COUNT(*)
FROM products
GROUP BY category;

-- Find average price of every category.
SELECT category,
AVG(price)
FROM products
GROUP BY category;

-- Display categories whose average price exceeds 40,000.
SELECT category,
AVG(price)
FROM products
GROUP BY category
HAVING AVG(price)>40000;

-- Create a procedure to show all orders of a customer.
DELIMITER $$

CREATE PROCEDURE GetOrders(IN cid INT)
BEGIN

SELECT
c.customer_name,
p.product_name,
o.quantity
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN products p
ON p.product_id=o.product_id
WHERE c.customer_id=cid;

END $$
DELIMITER ;

CALL GetOrders(1);

-- Find products whose price is greater than average price.
SELECT *
FROM products
WHERE price >
	(
		SELECT AVG(price)
		FROM products
);

-- Display, Customer Name, Product Name, Quantity, Total Price
SELECT
c.customer_name,
p.product_name,
o.quantity,
o.quantity*p.price AS TotalPrice
FROM orders o
JOIN customers c
ON c.customer_id=o.customer_id
JOIN products p
ON p.product_id=o.product_id;

-- Find products never ordered.
SELECT
p.*
FROM products p
LEFT JOIN orders o
ON p.product_id=o.product_id
WHERE o.product_id IS NULL;
