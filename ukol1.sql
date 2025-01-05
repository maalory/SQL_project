-- UKOL 1: rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
SELECT *
FROM PrimaryFinal
limit 5;
-- TAB 1 ...wage trend + comparison

   SELECT
       year,
       industry_name,
       total_gross_wage,
       LAG(total_gross_wage) OVER (PARTITION BY industry_name ORDER BY year) AS prev_gross_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
     AND industry_name IS NOT NULL;
