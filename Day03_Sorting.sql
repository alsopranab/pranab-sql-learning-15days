/* 
==================================================================================
DAY 03 – ORDER BY & LIMIT
==================================================================================
*/

USE pranab_learning;

-- 1. Sort by credit limit
SELECT *
FROM customer_data
ORDER BY credit_limit ASC;

-- 2. Descending order
SELECT *
FROM customer_data
ORDER BY credit_limit DESC;

-- 3. Top 3 customers by credit limit
SELECT *
FROM customer_data
ORDER BY credit_limit DESC
LIMIT 3;

-- 4. Bottom 3 customers
SELECT *
FROM customer_data
ORDER BY credit_limit ASC
LIMIT 3;
