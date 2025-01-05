-- UKOL 4 DONE Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
WITH price_growth AS (
-- TAB 1 DONE ...trend cen potravin - year, name, price, previous year price
   SELECT
       year,
       category_name,
       avg_price_value AS avg_price_value_per_year,
       LAG(avg_price_value) OVER (ORDER BY year) AS prev_avg_price_value
   FROM PrimaryFinal
   WHERE avg_price_value IS NOT NULL
   GROUP BY year),
-- TAB 2 ...trend mezd - year, price, previous year price
  	wage_growth AS (
   SELECT
       year,
       AVG(total_gross_wage) AS avg_wage_per_year,
       LAG(AVG(total_gross_wage)) OVER (ORDER BY year) AS prev_avg_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
   GROUP BY year),
-- TAB3 srovnani
	growth_comparison AS (
   SELECT
       p.year,
       ROUND(((p.avg_price_value_per_year - p.prev_avg_price_value) / p.prev_avg_price_value) * 100, 2) AS price_growth_percent,
       ROUND(((w.avg_wage_per_year - w.prev_avg_wage) / w.prev_avg_wage) * 100, 2) AS wage_growth_percent,
       ROUND(((p.avg_price_value_per_year - p.prev_avg_price_value) / p.prev_avg_price_value) * 100, 2) -
       ROUND(((w.avg_wage_per_year - w.prev_avg_wage) / w.prev_avg_wage) * 100, 2) AS growth_difference
   FROM price_growth p
   JOIN wage_growth w
       ON p.year = w.year
   WHERE p.prev_avg_price_value IS NOT NULL
     AND w.prev_avg_wage IS NOT NULL
)
-- prikaz
SELECT
   year,
   price_growth_percent,
   wage_growth_percent,
   growth_difference
FROM growth_comparison
WHERE growth_difference > 10
ORDER BY year;