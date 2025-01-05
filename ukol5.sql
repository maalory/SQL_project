-- Ukol 5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce,
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
-- TABULKA s HDP, GINI koeficientem
CREATE OR REPLACE VIEW SecondaryFinal AS (
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
and year >= 2000);

-- check
select *
from SecondaryFinal
WHERE GDP is not NULL
AND secondaryfinal.country = 'Czech Republic';

-- TABULKA HDP CZ LAG years
SELECT
	year,
	country,
	GDP as GDP_current_year,
	LAG(GDP) OVER (ORDER BY YEAR) AS GDP_previous_year
FROM secondaryfinal
WHERE GDP is not NULL
AND secondaryfinal.country = 'Czech Republic';