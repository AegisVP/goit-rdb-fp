-- 03. #####################################################
-- select top 10 countries with rabies, show min, avg, max per country

SELECT
    c.name,
    MIN(ic.Number_rabies) AS min_rabies,
    AVG(ic.Number_rabies) AS avg_rabies,
    MAX(ic.Number_rabies) AS max_rabies,
    SUM(ic.Number_rabies) AS total_rabies
FROM cases AS ic
    JOIN countries AS c ON ic.country_id = c.id
WHERE
    Number_rabies IS NOT NULL
    AND Number_rabies <> ''
GROUP BY
    c.name
ORDER BY avg_rabies DESC
LIMIT 10;