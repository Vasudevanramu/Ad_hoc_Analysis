#(3) provide a report with all the unique product counts for each 'segments' and sort them in descending order of the product counts.

SELECT 
	segment,
    count(distinct s.product_code) as product_count
FROM gdb0041.dim_product p
JOIN fact_sales_monthly s
USING (product_code)
GROUP BY segment
ORDER BY product_count DESC;