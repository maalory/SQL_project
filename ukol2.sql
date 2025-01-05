-- UKOL 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 WITH mleko_cena AS(
	SELECT
       year,
       category_name,
       avg_price_value as avg_price_value_milk,
       price_unit
   FROM PrimaryFinal
   WHERE category_name = 'Mléko polotučné pasterované'
   ),
   chleb_cena AS(
   SELECT
       year,
       category_name,
       avg_price_value as avg_price_value_bread,
       price_unit
   FROM PrimaryFinal
   WHERE category_name = 'Chléb konzumní kmínový'
   ),
   mzdy_y AS(
  	SELECT
       year,
       ROUND(AVG(total_gross_wage), 2) AS total_avg_gross_wage
   FROM PrimaryFinal
   WHERE total_gross_wage IS NOT NULL
   GROUP BY year
   ),
	cat_min_rok AS(
   select
  		min(year) as min_rok
   from PrimaryFinal
   where category_name is not null
   ),
   cat_max_rok AS (
   select
  		max(year) as max_rok
   from PrimaryFinal
   where category_name is not null
   ),
	combined_data AS (
   SELECT
       mzdy_y.year,
       mzdy_y.total_avg_gross_wage,
       mleko_cena.avg_price_value_milk,
       chleb_cena.avg_price_value_bread
   FROM mzdy_y
   JOIN mleko_cena
       ON mzdy_y.year = mleko_cena.year
   JOIN chleb_cena
       ON mzdy_y.year = chleb_cena.year
)
SELECT
   CASE
       WHEN cd.year = (SELECT min_rok FROM cat_min_rok) THEN 'Prvni rok'
       WHEN cd.year = (SELECT max_rok FROM cat_max_rok) THEN 'Posledni rok'
   END AS period,
   cd.year,
   ROUND(cd.total_avg_gross_wage / cd.avg_price_value_milk, 2) AS za_prumernou_mzdu_v_roce_litru_mleka,
   ROUND(cd.total_avg_gross_wage / cd.avg_price_value_bread, 2) AS za_prumernou_mzdu_v_roce_kg_chleba
FROM combined_data cd
WHERE cd.year IN ((SELECT min_rok FROM cat_min_rok), (SELECT max_rok FROM cat_max_rok));
