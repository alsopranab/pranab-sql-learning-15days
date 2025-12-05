/* 
==================================================================================
DAY 04 – DISTINCT, COUNT, LIKE, Wildcards
==================================================================================
*/

USE pranab_learning;

-- 1. Unique country list
SELECT DISTINCT country 
FROM customer_data;

-- 2. Count total customers
SELECT COUNT(*) AS total_customers
FROM customer_data;

-- 3. LIKE patterns
SELECT * FROM customer_data WHERE country LIKE 'I%';
SELECT * FROM customer_data WHERE state_code LIKE '__';   -- exactly 2 chars

-- 4. Combined LIKE
SELECT * FROM customer_data
WHERE country LIKE 'U%' OR country LIKE 'F%';
