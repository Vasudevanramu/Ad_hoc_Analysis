#(1) Provide the list of markets in which customer "Atliq Exclusive" operates it's business in the APAC region

SELECT distinct market
FROM gdb0041.dim_customer
WHERE customer = 'Atliq Exclusive' AND region = 'APAC'
ORDER BY market ASC;