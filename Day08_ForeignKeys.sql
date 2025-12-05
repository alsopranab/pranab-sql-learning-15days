/* 
==================================================================================
DAY 08 – FOREIGN KEYS + CASCADE
==================================================================================
*/

USE pranab_learning;

CREATE TABLE referral_log (
    ref_id VARCHAR(20) PRIMARY KEY,
    ref_emp_id VARCHAR(20),
    ref_name VARCHAR(100),
    ref_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ref_emp_id) REFERENCES employee_master(emp_id) ON DELETE CASCADE
);

INSERT INTO referral_log VALUES
('R1', 'E1001', 'Kritika', NOW()),
('R2', 'E1002', 'Suman', NOW());
