# (9)  Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH CTE as (
	SELECT 	c.channel as channel,
			Round(Sum(s.gross_price_total)/1000000,2) as gross_sales_ml
            #Sum(s.gross_price_total) as gross_sales_ml
	FROM gdb0041.gross_price_total s
	JOIN dim_customer c
	using (customer_code)
	where fiscal_year = 2021
	group by c.channel
	)
Select  channel,
		gross_sales_ml,
		concat(Round(gross_sales_ml *100 / sum(gross_sales_ml) over (),2), '%') as percentage
from CTE
order by percentage desc;