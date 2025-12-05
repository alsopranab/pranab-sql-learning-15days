/* 
==================================================================================
DAY 11 – SUBQUERIES (Basic, Nested, Correlated)
==================================================================================
*/

USE pranab_learning;

-- Customers above average credit limit
SELECT cust_name, credit_limit
FROM customer_data
WHERE credit_limit > (SELECT AVG(credit_limit) FROM customer_data);

-- Max credit limit
SELECT cust_name, credit_limit
FROM customer_data
WHERE credit_limit = (SELECT MAX(credit_limit) FROM customer_data);

-- Correlated subquery
SELECT p.product_name, p.price
FROM product_catalog p
WHERE p.price >
  (SELECT AVG(price) FROM product_catalog WHERE product_name = p.product_name);
