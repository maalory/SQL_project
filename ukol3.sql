-- UKOL 3 DONE Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
SELECT *
FROM PrimaryFinal
limit 5;
-- TAB 1 DONE ...trend cen potravin - year, name, price, previous year price
with price_growth AS(
	SELECT
       year,
       category_name,
       avg_price_value,
       LAG(avg_price_value) OVER (PARTITION BY category_name ORDER BY year) AS prev_avg_price_value
   FROM PrimaryFinal
  	WHERE category_code IS NOT NULL
  	),
-- TAB 2... %growth
  	percent_growth AS(
	SELECT
       year,
       category_name,
       avg_price_value,
       prev_avg_price_value,
       CASE
           WHEN prev_avg_price_value IS NOT NULL THEN
               ROUND(((avg_price_value - prev_avg_price_value) / prev_avg_price_value) * 100, 2)
           ELSE NULL
       END AS percent_change
   FROM price_growth
   ),
-- TAB 3...growth by cat
   avg_growth_by_category AS (
   SELECT
       category_name,
       ROUND(AVG(percent_change), 2) AS avg_percent_growth
   FROM percent_growth
   WHERE percent_change IS NOT NULL
   GROUP BY category_name
)
SELECT
   category_name,
   avg_percent_growth
FROM avg_growth_by_category
ORDER BY avg_percent_growth ASC
LIMIT 1;