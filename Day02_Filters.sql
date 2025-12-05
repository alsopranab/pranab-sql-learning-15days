/* 
==================================================================================
DAY 02 – DATA FILTERING  
Topic: WHERE, AND, OR, BETWEEN, NOT BETWEEN, IN, NOT IN
==================================================================================
*/

USE pranab_learning;

-- Create sample table for filtering practice
CREATE TABLE customer_data (
    cust_id INT,
    cust_name VARCHAR(100),
    country VARCHAR(50),
    state_code VARCHAR(10),
    credit_limit INT
);

-- Insert fictional data
INSERT INTO customer_data VALUES
(101, 'Rohit', 'India', 'KA', 45000),
(102, 'Meena', 'India', 'MH', 120000),
(103, 'Sameer', 'USA', 'CA', 90000),
(104, 'Priya', 'USA', 'NY', 23000),
(105, 'Aisha', 'France', NULL, 70000);

-- 1. Basic filter
SELECT * FROM customer_data WHERE credit_limit > 50000;

-- 2. Multiple conditions
SELECT * FROM customer_data 
WHERE country = 'USA' AND state_code = 'CA';

-- 3. BETWEEN
SELECT * FROM customer_data
WHERE credit_limit BETWEEN 30000 AND 100000;

-- 4. NOT BETWEEN
SELECT * FROM customer_data
WHERE credit_limit NOT BETWEEN 30000 AND 100000;

-- 5. IN
SELECT * FROM customer_data
WHERE country IN ('USA', 'France');

-- 6. NOT IN
SELECT * FROM customer_data
WHERE country NOT IN ('USA', 'France');
