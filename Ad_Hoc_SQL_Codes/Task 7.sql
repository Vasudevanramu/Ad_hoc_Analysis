# (7)  Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month 

SELECT concat(MONTHNAME(date), ' (' ,year(date), ')') as Month ,
		fiscal_year as Year,
        Sum(gross_price_total) as Gross_Sales_Amount
		#Concat('$', Round(Sum(gross_price_total/100000),2)) as Gross_Sales_Amount_ml
FROM gdb0041.gross_price_total g
join dim_customer c
using (customer_code)
where c.customer = 'Atliq Exclusive' and fiscal_year in (2020 , 2021)
group by Month, Year;