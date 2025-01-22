# SQL_project: Analyzing historic wages costs, food prices and GDP by data.gov of the Czech Republic

This project was developed as a practice task for my course Data Analyst with Python within the Engeto Academy.
 Its goal is to answer the below questions regarding the availability of basic foodstuffs in connection with the development of average wages in the Czech Republic.


The dataset comes from the Open Data Portal of the Czech Republic, freely available on data.gov.cz.


These datasets were transformed into a single dataset "PrimaryFinal" in the first phase, which is used by the SQL code of each task.



czechia_payroll � Information on wages in various industries over a period of several years. 

czechia_payroll_calculation � Calculation code in the wage table.

czechia_payroll_industry_branch � Industry code in the wage table.

czechia_payroll_unit � Unit code in the wage table.

czechia_payroll_value_type � Code list of value types in the wage table.

czechia_price � Information on prices of selected food items for a period of several years.

czechia_price_category � Code list of food categories that appear in our overview.

czechia_region � Code list of regions of the Czech Republic according to the CZ-NUTS 2 standard.

czechia_district � Code list of districts of the Czech Republic according to the LAU standard.

countries - All kinds of information about countries in the world, for example, capital, currency, national dish or average population size.

economies - GDP, GINI, tax burden, etc. for a given country and year.



Research questions:

1) Do wages in all sectors increase over the years, or do they decrease in some?

2) How many liters of milk and kilograms of bread can be bought for the first and last comparable period in the available price and wage data?

3) Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?

4) Is there a year in which the year-on-year increase in food prices was significantly higher than the increase in wages (greater than 10%)?

5) Does the level of GDP affect changes in wages and food prices? Or, if GDP increases more significantly in one year, will this be reflected in a more significant increase in food prices or wages in the same or the following year

______________________________________________________________________________________________________________________
Tento projekt byl vypracov�n jako cvicn� �kol m�ho kurzu Datov� analytik s Pythonem v r�mci akademie Engeto.
M� za c�l zodpovedet n�e uveden� ot�zky ohledne dostupnosti z�kladn�ch potravin ve spojitosti s v�vojem prumern�ch mezd v Cesk� republice.

Jako podklad byly pou�ity otevren� data z datov�ho port�lu data.gov.cz.
Jednotliv� tabulky byly v prvn� f�zi transformov�ny do jednoho datasetu "PrimaryFinal", se kter�m pracuje SQL k�d ka�d�ho �kolu.

czechia_payroll � Informace o mzd�ch v ruzn�ch odvetv�ch za nekolikalet� obdob�.
czechia_payroll_calculation � C�seln�k kalkulac� v tabulce mezd.
czechia_payroll_industry_branch � C�seln�k odvetv� v tabulce mezd.
czechia_payroll_unit � C�seln�k jednotek hodnot v tabulce mezd.
czechia_payroll_value_type � C�seln�k typu hodnot v tabulce mezd.
czechia_price � Informace o cen�ch vybran�ch potravin za nekolikalet� obdob�.
czechia_price_category � C�seln�k kategori� potravin, kter� se vyskytuj� v na�em prehledu.
czechia_region � C�seln�k kraju Cesk� republiky dle normy CZ-NUTS 2.
czechia_district � C�seln�k okresu Cesk� republiky dle normy LAU.
countries - V�emo�n� informace o zem�ch na svete, napr�klad hlavn� mesto, mena, n�rodn� j�dlo nebo prumern� v��ka populace.
economies - HDP, GINI, danov� z�te�, atd. pro dan� st�t a rok.


V�zkumn� ot�zky:
1) Rostou v prubehu let mzdy ve v�ech odvetv�ch, nebo v nekter�ch klesaj�?
2) Kolik je mo�n� si koupit litru ml�ka a kilogramu chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?
3) Kter� kategorie potravin zdra�uje nejpomaleji (je u n� nejni��� percentu�ln� mezirocn� n�rust)?
4) Existuje rok, ve kter�m byl mezirocn� n�rust cen potravin v�razne vy��� ne� rust mezd (vet�� ne� 10 %)?
5) M� v��ka HDP vliv na zmeny ve mzd�ch a cen�ch potravin? Neboli, pokud HDP vzroste v�razneji v jednom roce, projev� se to na cen�ch potravin ci mzd�ch ve stejn�m nebo n�sduj�c�m roce v�raznej��m rustem?