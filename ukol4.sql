-- UKOL 4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
SELECT *
FROM PrimaryFinal
limit 5;

-- TAB 1 DONE ...trend cen potravin - year, name, price, previous year price
   SELECT
       year,
       category_name,
       avg_price_value AS avg_price_value_per_year,
       LAG(avg_price_value) OVER (ORDER BY year) AS prev_avg_price_value
   FROM PrimaryFinal
   WHERE avg_price_value IS NOT NULL
   GROUP BY year;
   
-- TAB 2 ...trend mezd - year, price, previous year price

   SELECT
       year,
       AVG(total_gross_wage) AS avg_wage,
       LAG(AVG(total_gross_wage)) OVER (ORDER BY year) AS prev_avg_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
   GROUP BY year;