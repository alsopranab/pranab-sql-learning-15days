/* 
==================================================================================
DAY 13 – USER DEFINED FUNCTIONS
==================================================================================
*/

USE pranab_learning;

DELIMITER $$

CREATE FUNCTION fn_add_values(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END $$

DELIMITER ;

SELECT fn_add_values(12, 15);
