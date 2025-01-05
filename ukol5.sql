-- Ukol 5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce,
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

WITH gdp_changes AS (
   SELECT
       year,
       GDP,
       LAG(GDP) OVER (ORDER BY year) AS prev_GDP,
       (GDP - LAG(GDP) OVER (ORDER BY year)) / LAG(GDP) OVER (ORDER BY year) * 100 AS gdp_growth_rate
   FROM SecondaryFinal
   WHERE GDP IS NOT NULL
   AND secondaryfinal.country = 'Czech Republic'
),
wage_changes AS (
   SELECT
       year,
       AVG(total_gross_wage) AS avg_wage,
       LAG(AVG(total_gross_wage)) OVER (ORDER BY year) AS prev_avg_wage,
       (AVG(total_gross_wage) - LAG(AVG(total_gross_wage)) OVER (ORDER BY year)) / LAG(AVG(total_gross_wage)) OVER (ORDER BY year) * 100 AS wage_growth_rate
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
   GROUP BY year
),
price_changes AS (
   SELECT
       year,
       AVG(avg_price_value) AS avg_price,
       LAG(AVG(avg_price_value)) OVER (ORDER BY year) AS prev_avg_price,
       (AVG(avg_price_value) - LAG(AVG(avg_price_value)) OVER (ORDER BY year)) / LAG(AVG(avg_price_value)) OVER (ORDER BY year) * 100 AS price_growth_rate
   FROM PrimaryFinal
   WHERE avg_price_value IS NOT NULL
   GROUP BY year
),
combined_data AS (
   SELECT
       g.year,
       g.gdp_growth_rate,
       w.wage_growth_rate,
       p.price_growth_rate
   FROM gdp_changes g
   LEFT JOIN wage_changes w ON g.year = w.year
   LEFT JOIN price_changes p ON g.year = p.year
)
SELECT
   year,
   ROUND(gdp_growth_rate, 2) AS gdp_growth_rate_pcnt,
   ROUND(wage_growth_rate, 2) AS wage_growth_rate_pcnt,
   ROUND(price_growth_rate, 2) AS price_growth_rate_pcnt,
   CASE
       WHEN gdp_growth_rate > 5 AND (wage_growth_rate > 5 OR price_growth_rate > 5) THEN 'higher than 5%'
       ELSE 'lower than 5%'
   END AS gdp_wage_prices_change
FROM combined_data
ORDER BY year;
