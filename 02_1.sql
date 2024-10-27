-- 1st way of doing it by modifying the original table:

ALTER TABLE infectious_cases
ADD COLUMN id INT NOT NULL AUTO_INCREMENT FIRST,
ADD COLUMN country_id INT NULL
AFTER id,
ADD PRIMARY KEY (id);

ALTER TABLE infectious_cases
ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES countries (id) ON DELETE RESTRICT ON UPDATE CASCADE;

DROP PROCEDURE IF EXISTS PopulateCountryIds;

DELIMITER //

CREATE PROCEDURE PopulateCountryIds()
BEGIN
	DECLARE cname VARCHAR(255);
    DECLARE cid INT;
    DECLARE num_rows INT;

    SELECT COUNT(*) INTO num_rows FROM countries;

    REPEAT
        SET num_rows = num_rows - 1;
		SELECT id, name INTO cid, cname FROM countries LIMIT num_rows, 1;
        UPDATE infectious_cases SET country_id = cid WHERE Entity = cname;
    UNTIL num_rows = 0
    END REPEAT;
END //

DELIMITER ;

CALL PopulateCountryIds ();

ALTER TABLE infectious_cases
DROP COLUMN Entity,
DROP COLUMN Code,
RENAME TO cases;
