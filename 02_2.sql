-- 2nd way of doing it by copying data to separate tables (the easier way):

DROP TABLE IF EXISTS cases;

CREATE TABLE cases (
    id INT NOT NULL AUTO_INCREMENT,
    country_id INT,
    year YEAR,
    Number_yaws VARCHAR(45),
    polio_cases VARCHAR(45),
    cases_guinea_worm VARCHAR(45),
    Number_rabies VARCHAR(45),
    Number_malaria VARCHAR(45),
    Number_hiv VARCHAR(45),
    Number_tuberculosis VARCHAR(45),
    Number_smallpox VARCHAR(45),
    Number_cholera_cases VARCHAR(45),
    PRIMARY KEY (id)
);

INSERT INTO
    cases (
        country_id,
        year,
        Number_yaws,
        polio_cases,
        cases_guinea_worm,
        Number_rabies,
        Number_malaria,
        Number_hiv,
        Number_tuberculosis,
        Number_smallpox,
        Number_cholera_cases
    )
SELECT c.id, ic.year, ic.Number_yaws, ic.polio_cases, ic.cases_guinea_worm, ic.Number_rabies, ic.Number_malaria, ic.Number_hiv, ic.Number_tuberculosis, ic.Number_smallpox, ic.Number_cholera_cases
FROM
    infectious_cases AS ic
    JOIN countries AS c ON c.name = ic.Entity;

DROP TABLE IF EXISTS infectious_cases;