/* 
==================================================================================
DAY 12 – WINDOW FUNCTIONS
==================================================================================
*/

USE pranab_learning;

CREATE TABLE sales_report (
    sales_id INT,
    sales_person VARCHAR(100),
    sales_year INT,
    amount INT
);

-- ROW_NUMBER
SELECT 
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_no,
    sales_person, amount
FROM sales_report;

-- RANK
SELECT 
    RANK() OVER (ORDER BY amount DESC) AS rank_no,
    sales_person, amount
FROM sales_report;

-- LAG
SELECT 
    sales_person,
    amount,
    LAG(amount, 1) OVER (ORDER BY sales_year) AS prev_year_sales
FROM sales_report;
