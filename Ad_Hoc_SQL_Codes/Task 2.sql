#(2) what is the precentage of  uniqe product increased in 2021 vs 2020?

CREATE TEMPORARY TABLE prod_2020 
		SELECT Count(distinct s.product_code) as unique_products_2020
		FROM gdb0041.dim_product p
		join fact_sales_monthly s
		using (product_code)
		where s.fiscal_year = 2020;
CREATE TEMPORARY TABLE prod_2021 
		SELECT Count(distinct s.product_code) as unique_products_2021
		FROM gdb0041.dim_product p
		JOIN fact_sales_monthly s
		USING (product_code)
		WHERE s.fiscal_year = 2021;
WITH CTE  as (      
		SELECT 	unique_products_2020 as unique_products_2020, 
		(SELECT unique_products_2021 FROM prod_2021) as unique_products_2021
    FROM prod_2020)
SELECT *,
		round((unique_products_2021 - unique_products_2020)*100 / unique_products_2020,2) as percentage_chg
FROM CTE;