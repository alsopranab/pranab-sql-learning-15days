/* 
==================================================================================
DAY 15 – TRIGGERS, VIEWS, INDEXES
==================================================================================
*/

USE pranab_learning;

-- VIEW 1
CREATE OR REPLACE VIEW vw_customer_states AS
SELECT cust_id, cust_name, state_code FROM customer_data;

-- VIEW 2: Top credit limit
CREATE OR REPLACE VIEW vw_top_credit_users AS
SELECT cust_id, cust_name, credit_limit
FROM customer_data
ORDER BY credit_limit DESC
LIMIT 10;

-- INDEX
CREATE INDEX idx_customer_country ON customer_data(country);

-- TRIGGER: After delete log
CREATE TABLE deletion_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    deleted_cust_id INT,
    deleted_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER tr_after_customer_delete
AFTER DELETE ON customer_data
FOR EACH ROW
BEGIN
    INSERT INTO deletion_log(deleted_cust_id)
    VALUES (OLD.cust_id);
END $$
DELIMITER ;
