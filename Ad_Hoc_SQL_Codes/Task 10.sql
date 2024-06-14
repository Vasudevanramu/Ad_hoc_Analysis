# (10)  Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?

WITH CTE as (
    SELECT 	p.division,
			s.product_code as product_code,
			p.product as product,
			sum(sold_quantity) as total_sold_quantity 
	FROM gdb0041.fact_sales_monthly s
	JOIN dim_product p
	Using ( product_code)
    where s.fiscal_year = 2021 
	group by p.division,s.product_code,p.product
    ),
	CTE2 as(
	Select *,
		Rank() over(partition by division  order by total_sold_quantity desc ) as rank_order
	FROM CTE 
)
Select * from CTE2
Where rank_order <=3 