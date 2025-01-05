-- UKOL 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT
   year,
   sum(total_gross_wage)
FROM PrimaryFinal
group by year;

SELECT
   min(year),
   category_name,
   avg_price_value,
   price_unit
FROM PrimaryFinal
WHERE category_name = 'Mléko polotučné pasterované';

-- !!!OK mleko_cena_y: roky + cena mleka
   SELECT
       year,
       category_name,
       avg_price_value,
       price_unit
   FROM PrimaryFinal
   WHERE category_name = 'Mléko polotučné pasterované';
  
-- !!!OK chleba_cena_y: roky + cena mleka
   SELECT
       year,
       category_name,
       avg_price_value,
       price_unit
   FROM PrimaryFinal
   WHERE category_name = 'Chléb konzumní kmínový';
  
 -- !!!mzdy_y
   SELECT
       year,
       ROUND(AVG(total_gross_wage), 2) AS total_avg_gross_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
   GROUP BY year;
 
-- min rok mzdy (2000) - nepoužívat
  select
  		min(year) as min_rok_mzdy
  from PrimaryFinal
  where total_gross_wage is not null;
 
-- max rok mzdy (2021) - nepoužívat
  select
  		max(year) as max_rok_mzdy
  from PrimaryFinal
  where total_gross_wage is not null;
 
 -- !!!min rok ceny (2006)
  select
  		min(year) as min_rok
  from PrimaryFinal
  where category_name is not null; 
 
-- !!!max rok ceny (2018)
  select
  		max(year) as max_rok
  from PrimaryFinal
  where category_name is not null;