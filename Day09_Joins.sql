/* 
==================================================================================
DAY 09 – JOINS (INNER, LEFT, RIGHT, FULL, SELF)
==================================================================================
*/

USE pranab_learning;

-- Create demo tables
CREATE TABLE order_records (
    order_id INT,
    cust_id INT,
    order_date DATE,
    order_status VARCHAR(20)
);

CREATE TABLE product_catalog (
    product_code VARCHAR(20),
    product_name VARCHAR(100),
    price INT
);

-- INNER JOIN
SELECT c.cust_name, o.order_id, o.order_status
FROM customer_data c
INNER JOIN order_records o
ON c.cust_id = o.cust_id;

-- LEFT JOIN
SELECT c.cust_name, o.order_id
FROM customer_data c
LEFT JOIN order_records o ON c.cust_id = o.cust_id;

-- SELF JOIN example
SELECT 
    e1.emp_name AS employee,
    e2.emp_name AS manager
FROM employee_master e1
JOIN employee_master e2
ON e1.referral_code = e2.referral_code;
