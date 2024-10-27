-- 05. #####################################################
-- build a function to give year difference

DROP FUNCTION IF EXISTS YEARDIFF;

DELIMITER //

CREATE FUNCTION YEARDIFF(in_year INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    IF in_year < 0 OR in_year > 9999  THEN RETURN 0;
    ELSEIF in_year < YEAR(CURDATE()) THEN RETURN YEAR(FROM_DAYS(DATEDIFF(CURDATE(), MAKEDATE(in_year, 1))));
    ELSEIF in_year > YEAR(CURDATE()) THEN RETURN YEAR(FROM_DAYS(DATEDIFF(MAKEDATE(in_year, 365), CURDATE())));
    ELSE RETURN 0;
    END IF;
END //

DELIMITER ;

SELECT YEARDIFF(30);
