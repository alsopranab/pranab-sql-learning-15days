/* 
==================================================================================
DAY 10 – BUSINESS LOGIC QUERIES (SALES, TOTALS)
==================================================================================
*/

USE pranab_learning;

CREATE TABLE payment_history (
    payment_id INT,
    cust_id INT,
    amount INT,
    payment_date DATE
);

-- Total spent by each customer
SELECT cust_id, SUM(amount) AS total_spent
FROM payment_history
GROUP BY cust_id;

-- Highest paying customers
SELECT cust_id, SUM(amount) AS total_spent
FROM payment_history
GROUP BY cust_id
ORDER BY total_spent DESC
LIMIT 5;
