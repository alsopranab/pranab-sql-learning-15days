/* 
==================================================================================
DAY 05 – SQL FUNCTIONS + CASE Expressions
==================================================================================
*/

USE pranab_learning;

-- 1. Calculated column
SELECT cust_name, credit_limit, credit_limit * 0.15 AS bonus_amount
FROM customer_data;

-- 2. Rounding
SELECT cust_id, ROUND(credit_limit / 3, 0) AS rounded_value
FROM customer_data;

-- 3. ABS, POW
SELECT ABS(-45) AS positive_value;
SELECT POW(3, 4) AS power_result;

-- 4. Categorize customers
SELECT cust_name, credit_limit,
CASE
    WHEN credit_limit > 90000 THEN 'High Value'
    WHEN credit_limit BETWEEN 40000 AND 90000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS category
FROM customer_data;
