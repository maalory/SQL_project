--- TABULKA 1 DONE - KOMODITY - PricesByYear ... year, code, name, avg_price
    
SELECT
    	date_format(cp.date_from, '%Y') as year,
		cp.category_code,
		cpc.name,
		cpc.price_value as unit_value,
		cpc.price_unit,
		round(AVG(cp.value),2) as avg_price_value
    FROM 
        czechia_price cp
    JOIN czechia_price_category cpc 
    	on cpc.code = cp.category_code
    GROUP BY 
   		date_format(cp.date_from, '%Y'), 
    	cp.category_code, 
    	cpc.name, 
   		cpc.price_value, 
   		cpc.price_unit;
   		
-- TABULKA 2 DONE - CZ_PAYROLL - year, industry_branch_code, branch -> cz_payroll_industry_branch, filtr: NULL, value_type_code = 5958 = mzda
SELECT
	pay.payroll_year,
	pay.industry_branch_code,
	cpib.name,
	sum(pay.value) as total_gross_wage
FROM czechia_payroll pay
JOIN czechia_payroll_industry_branch cpib
	ON cpib.code = pay.industry_branch_code
WHERE pay.value is not null
AND pay.industry_branch_code is not null
AND pay.value_type_code = 5958
AND pay.calculation_code = 200
GROUP BY pay.payroll_year, pay.industry_branch_code, cpib.name;

-- TABULKA 3 DONE...HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.
-- t_{jmeno}_{prijmeni}_project_SQL_secondary_final
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


-- TABULKA JoinedData ...Spojení tabulek cz_payroll a PricesByYear podle roků
-- t_{jmeno}_{prijmeni}_project_SQL_primary_final
CREATE OR REPLACE VIEW PrimaryFinal AS
WITH PricesByYear AS (
   SELECT
       date_format(cp.date_from, '%Y') AS year,
       cp.category_code,
       cpc.name AS category_name,
       cpc.price_value AS unit_value,
       cpc.price_unit,
       ROUND(AVG(cp.value), 2) AS avg_price_value
   FROM
       czechia_price cp
   JOIN czechia_price_category cpc
       ON cpc.code = cp.category_code
   GROUP BY
       date_format(cp.date_from, '%Y'),
       cp.category_code,
       cpc.name,
       cpc.price_value,
       cpc.price_unit
),
CZ_Payroll AS (
   SELECT
       pay.payroll_year AS year,
       pay.industry_branch_code,
       cpib.name AS industry_name,
       SUM(pay.value) AS total_gross_wage
   FROM czechia_payroll pay
   INNER JOIN czechia_payroll_industry_branch cpib
       ON cpib.code = pay.industry_branch_code
   WHERE pay.value IS NOT NULL
     AND pay.industry_branch_code IS NOT NULL
     AND pay.value_type_code = 5958
   GROUP BY
       pay.payroll_year,
       pay.industry_branch_code,
       cpib.name
)
SELECT
   pby.year,
   pby.category_code,
   pby.category_name,
   pby.unit_value AS price_unit_value,
   pby.price_unit,
   pby.avg_price_value,
   NULL as industry_branch_code,
   NULL as industry_name,
   NULL as total_gross_wage
FROM PricesByYear pby
UNION ALL
SELECT
   czp.year,
   NULL as category_code,
   NULL as category_name,
   NULL as price_unit_value,
   NULL as price_unit,
   NULL as avg_price_value,
   czp.industry_branch_code,
   czp.industry_name,
   czp.total_gross_wage
FROM CZ_Payroll czp
;

select *
from PrimaryFinal
limit 5;
