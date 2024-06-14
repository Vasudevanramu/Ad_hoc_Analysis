# (4) Which segment had the most increase in unique products in 2020 vs 2021?

With CTE1 as (
		Select
			p.segment,
			count(distinct s.product_code) as product_count_2020
		from fact_sales_monthly s
		join dim_product p
		Using (product_code)
		where fiscal_year = 2020
		group by p.segment
		order by product_count_2020 desc),
	 CTE2 as (
		Select 
			p.segment,
			count(distinct s.product_code) as product_count_2021
		from fact_sales_monthly s
		join dim_product p
		Using (product_code)
		where fiscal_year = 2021
		group by p.segment
		order by product_count_2021 desc)
Select 
	segment,
	product_count_2020 as product_count_2020,
	b.product_count_2021 as product_count_2021,
	ABS(product_count_2021- product_count_2020) as difference
From CTE1 a
join CTE2 b
using (segment)
order by difference desc;