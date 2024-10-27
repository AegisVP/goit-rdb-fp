-- 02. #####################################################
-- Normalize data to get rid of repeated entries
DROP TABLE IF EXISTS country;

CREATE TABLE IF NOT EXISTS countries (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(15) NULL,
    PRIMARY KEY (id)
);

INSERT INTO
    countries (name, code)
SELECT DISTINCT
    Entity AS name,
    Code as code
FROM infectious_cases;

-- From here there are two ways normalization is solved.
-- Both presented in 02_1.sql and 02_2.sql

-- After the normalization, run this SELECT to confirm

SELECT * FROM cases;