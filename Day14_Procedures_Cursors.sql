/* 
==================================================================================
DAY 14 – STORED PROCEDURES, IN/OUT, CURSORS
==================================================================================
*/

USE pranab_learning;

DELIMITER $$

CREATE PROCEDURE proc_fetch_country(IN country_name VARCHAR(50))
BEGIN
    SELECT cust_name, country FROM customer_data WHERE country = country_name;
END $$

DELIMITER ;


-- Cursor Example
DELIMITER $$

CREATE PROCEDURE proc_name_list(OUT full_list VARCHAR(2000))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE name_item VARCHAR(100);

    DECLARE cur CURSOR FOR SELECT cust_name FROM customer_data;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SET full_list = '';

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO name_item;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SET full_list = CONCAT(full_list, name_item, '; ');
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;
