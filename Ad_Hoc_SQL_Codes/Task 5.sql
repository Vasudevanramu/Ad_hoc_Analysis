# (5) product that have the highest and lowest manufacturing costs

SELECT 	p.product_code,
		p.product,
        m.manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
using (product_code)
where 
	manufacturing_cost = (select Max(manufacturing_cost) from fact_manufacturing_cost) or
	manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
Order by manufacturing_cost Desc;