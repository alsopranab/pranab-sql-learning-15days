/* 
==================================================================================
DAY 07 – SQL CONSTRAINTS
==================================================================================
*/

USE pranab_learning;

-- Employee table with constraints
CREATE TABLE employee_master (
    emp_id VARCHAR(20) PRIMARY KEY,
    referral_code VARCHAR(20) UNIQUE,
    emp_name VARCHAR(100) NOT NULL,
    emp_age INT CHECK (emp_age BETWEEN 21 AND 55),
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employee_master (emp_id, referral_code, emp_name, emp_age)
VALUES
('E1001', 'REF101', 'Amit', 29),
('E1002', 'REF104', 'Neha', 32);
