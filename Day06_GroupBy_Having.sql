/* 
==================================================================================
DAY 06 – GROUP BY & HAVING
==================================================================================
*/

USE pranab_learning;

-- 1. Avg credit limit per country
SELECT country, AVG(credit_limit) AS avg_limit
FROM customer_data
GROUP BY country;

-- 2. Total credit per country
SELECT country, SUM(credit_limit) AS total_limit
FROM customer_data
GROUP BY country;

-- 3. HAVING
SELECT country, AVG(credit_limit) AS avg_limit
FROM customer_data
GROUP BY country
HAVING AVG(credit_limit) > 60000;

-- 4. Max & Min
SELECT MAX(credit_limit) AS highest, MIN(credit_limit) AS lowest
FROM customer_data;
