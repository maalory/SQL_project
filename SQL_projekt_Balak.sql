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