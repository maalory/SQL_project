-- TABULKA 3 s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.
-- t_tomas_balak_project_SQL_secondary_final
SELECT
	e.year,
	e.country,
	e.population,
	e.GDP,
	e.gini
FROM economies e
JOIN countries c
	on c.country = e.country
WHERE c.continent = 'Europe'
and year >= 2000;