-- 01. #####################################################
-- Create schema and import data
DROP SCHEMA IF EXISTS pandemic;

CREATE SCHEMA IF NOT EXISTS pandemic;

USE pandemic;

--  Import data using Table Data Import Wizard into infectious_cases table, select rows to verify import

SELECT * FROM infectious_cases;