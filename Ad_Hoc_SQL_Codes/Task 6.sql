# (6) Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the Indian  market.

SELECT 	f.customer_code,
		c.customer,
		Round(avg(pre_invoice_discount_pct),4)  avg_discount_percentage
FROM gdb0041.fact_pre_invoice_deductions f
join dim_customer c
using(customer_code)
where	fiscal_year = 2021 and 
		c.market = 'india'
group by customer_code
order by avg_discount_percentage desc
limit 5;