# (8) In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,

SELECT 
	CASE
		WHEN month(date) IN (9,10,11)	THEN "Q1"
		WHEN month(date) IN (12,1,2)	THEN "Q2"
		WHEN month(date) IN (3,4,5)		THEN "Q3"
		WHEN month(date) IN (6,7,8)		THEN "Q4"
	END as Quarters,
	SUM(sold_quantity) as total_sold_quantity
FROM gdb0041.fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY  Quarters;

# (8.1) Additionally further more wide stretched by month-wise

WITH CTE as(
	SELECT 
		CASE	
			WHEN monthname(date) = 'September'  THEN '[1] September'
			WHEN monthname(date) = 'October'	THEN '[1] October'
			WHEN monthname(date) = 'November'  	THEN '[1] November'
			WHEN monthname(date) = 'December'  	THEN '[2] December'
			WHEN monthname(date) = 'January' 	THEN '[2] January'
			WHEN monthname(date) = 'February'  	THEN '[2] February'
			WHEN monthname(date) = 'March'  	THEN '[3] March'
			WHEN monthname(date) = 'April'  	THEN '[3] April'
			WHEN monthname(date) = 'May'  		THEN '[3] May'
			WHEN monthname(date) = 'June'  		THEN '[4] June'
			WHEN monthname(date) = 'July'  		THEN '[4] July'
			WHEN monthname(date) = 'August'  	THEN '[4] August'
		END as Quarters,
		SUM(sold_quantity) as total_sold_qty
	FROM gdb0041.fact_sales_monthly
    WHERE fiscal_year = 2020
	GROUP BY Quarters
)
Select Quarters,total_sold_qty
FROM CTE c
JOIN monthorder_ m
ON c.Quarters = m.FYMonth
ORDER BY m. _order;

CREATE TABLE monthorder_ (
    _order tinyint,
    FYMonth varchar(25)
);
INSERT INTO monthorder_ (_order, FYMonth)
VALUES
	('01', '[1] September'),
	('02', '[1] October'),
    ('03', '[1] November'),
    ('03', '[2] December'),
    ('05', '[2] January'),
    ('06', '[2] February'),
    ('07', '[3] March'),
    ('08', '[3] April'),
    ('09', '[3] May'),
    ('10', '[4] June'),
    ('11', '[4] July'),
    ('12', '[4] August');