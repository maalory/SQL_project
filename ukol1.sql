-- UKOL 1: rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
WITH wage_trends AS (
   SELECT
       year,
       industry_name,
       total_gross_wage,
       LAG(total_gross_wage) OVER (PARTITION BY industry_name ORDER BY year) AS prev_gross_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
     AND industry_name IS NOT NULL
),
wage_comparison AS (
   SELECT
       industry_name,
       year,
       total_gross_wage,
       prev_gross_wage,
       CASE
           WHEN prev_gross_wage IS NOT NULL AND total_gross_wage < prev_gross_wage THEN 1
           ELSE 0
       END AS wage_decline_flag
   FROM wage_trends
)
SELECT
   industry_name as odvetvi,
   COUNT(*) AS pocet_let_v_analyze,
   SUM(wage_decline_flag) AS pocet_let_s_poklesem,
   CASE
       WHEN SUM(wage_decline_flag) > 0 THEN 'Pokles'
       ELSE 'Růst'
   END AS trend
FROM wage_comparison
GROUP BY industry_name
ORDER BY pocet_let_s_poklesem DESC;