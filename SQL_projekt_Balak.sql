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
   		
 -- TEST