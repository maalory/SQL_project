# SQL_project: Analyzing historic wages costs, food prices and GDP by data.gov of the Czech Republic

This project was developed as a practice task for my course Data Analyst with Python within the Engeto Academy.
 Its goal is to answer the below questions regarding the availability of basic foodstuffs in connection with the development of average wages in the Czech Republic.


The dataset comes from the Open Data Portal of the Czech Republic, freely available on data.gov.cz.


These datasets were transformed into a single dataset "PrimaryFinal" in the first phase, which is used by the SQL code of each task.



czechia_payroll – Information on wages in various industries over a period of several years. 

czechia_payroll_calculation – Calculation code in the wage table.

czechia_payroll_industry_branch – Industry code in the wage table.

czechia_payroll_unit – Unit code in the wage table.

czechia_payroll_value_type – Code list of value types in the wage table.

czechia_price – Information on prices of selected food items for a period of several years.

czechia_price_category – Code list of food categories that appear in our overview.

czechia_region – Code list of regions of the Czech Republic according to the CZ-NUTS 2 standard.

czechia_district – Code list of districts of the Czech Republic according to the LAU standard.

countries - All kinds of information about countries in the world, for example, capital, currency, national dish or average population size.

economies - GDP, GINI, tax burden, etc. for a given country and year.



Research questions:

1) Do wages in all sectors increase over the years, or do they decrease in some?

2) How many liters of milk and kilograms of bread can be bought for the first and last comparable period in the available price and wage data?

3) Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?

4) Is there a year in which the year-on-year increase in food prices was significantly higher than the increase in wages (greater than 10%)?

5) Does the level of GDP affect changes in wages and food prices? Or, if GDP increases more significantly in one year, will this be reflected in a more significant increase in food prices or wages in the same or the following year

______________________________________________________________________________________________________________________
Tento projekt byl vypracován jako cvicný úkol mého kurzu Datový analytik s Pythonem v rámci akademie Engeto.
Má za cíl zodpovedet níže uvedené otázky ohledne dostupnosti základních potravin ve spojitosti s vývojem prumerných mezd v Ceské republice.

Jako podklad byly použity otevrená data z datového portálu data.gov.cz.
Jednotlivé tabulky byly v první fázi transformovány do jednoho datasetu "PrimaryFinal", se kterým pracuje SQL kód každého úkolu.

czechia_payroll – Informace o mzdách v ruzných odvetvích za nekolikaleté období.
czechia_payroll_calculation – Císelník kalkulací v tabulce mezd.
czechia_payroll_industry_branch – Císelník odvetví v tabulce mezd.
czechia_payroll_unit – Císelník jednotek hodnot v tabulce mezd.
czechia_payroll_value_type – Císelník typu hodnot v tabulce mezd.
czechia_price – Informace o cenách vybraných potravin za nekolikaleté období.
czechia_price_category – Císelník kategorií potravin, které se vyskytují v našem prehledu.
czechia_region – Císelník kraju Ceské republiky dle normy CZ-NUTS 2.
czechia_district – Císelník okresu Ceské republiky dle normy LAU.
countries - Všemožné informace o zemích na svete, napríklad hlavní mesto, mena, národní jídlo nebo prumerná výška populace.
economies - HDP, GINI, danová zátež, atd. pro daný stát a rok.


Výzkumné otázky:
1) Rostou v prubehu let mzdy ve všech odvetvích, nebo v nekterých klesají?
2) Kolik je možné si koupit litru mléka a kilogramu chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální mezirocní nárust)?
4) Existuje rok, ve kterém byl mezirocní nárust cen potravin výrazne vyšší než rust mezd (vetší než 10 %)?
5) Má výška HDP vliv na zmeny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazneji v jednom roce, projeví se to na cenách potravin ci mzdách ve stejném nebo násdujícím roce výraznejším rustem?