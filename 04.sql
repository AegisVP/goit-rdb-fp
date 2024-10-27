-- 04. #####################################################
-- build date elements for table

SELECT DISTINCT
    year,
    MAKEDATE(year, 1) AS date,
    CURDATE() AS today,
    YEAR(FROM_DAYS(DATEDIFF(CURDATE(), MAKEDATE(year, 1)))) AS diff
FROM cases
ORDER BY year DESC;
