/* 
==================================================================================
DAY 01 – BASIC SQL COMMANDS  
Topic: Creating a database, tables, inserting records, and simple SELECT queries.
This script is rewritten uniquely for Pranab's SQL portfolio.
==================================================================================
*/

-- 1. Create a dedicated database for practice
CREATE DATABASE IF NOT EXISTS pranab_learning;

-- Activate the database
USE pranab_learning;

-----------------------------------------------------------------------------------
-- 2. Create a basic employee table
-----------------------------------------------------------------------------------

CREATE TABLE employee_info (
    emp_id      INT,
    full_name   VARCHAR(100),
    age         INT,
    company_name VARCHAR(100),
    joining_date DATE
);

-----------------------------------------------------------------------------------
-- 3. Insert sample records into employee_info
-- (Sample values are fictional and created uniquely for this portfolio)
-----------------------------------------------------------------------------------

INSERT INTO employee_info VALUES
(1, 'Arjun', 26, 'AlphaTech', '2020-05-17'),
(2, 'Bhavik', 33, 'NextWave', '2010-02-13'),
(3, 'Charan', 35, 'BrightSoft', '2015-08-26');

-----------------------------------------------------------------------------------
-- 4. Basic SELECT usage
-----------------------------------------------------------------------------------

-- Fetch all columns
SELECT * 
FROM employee_info;

-- Fetch selected columns
SELECT full_name, joining_date
FROM employee_info;
