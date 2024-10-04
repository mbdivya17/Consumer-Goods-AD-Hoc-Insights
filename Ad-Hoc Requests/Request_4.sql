WITH cte1 AS 
			(SELECT p.segment AS segment , COUNT(DISTINCT(s.product_code)) AS unique_products_2020
			FROM dim_product p, fact_sales_monthly s
			WHERE p.product_code = s.product_code
			GROUP BY s.fiscal_year, p.segment
			HAVING s.fiscal_year = 2020),
     cte2 AS
			(SELECT p.segment AS segment , COUNT(DISTINCT(s.product_code)) AS unique_products_2021
			FROM dim_product p, fact_sales_monthly s
			WHERE p.product_code = s.product_code
			GROUP BY s.fiscal_year, p.segment
			HAVING s.fiscal_year = 2021)     
SELECT 
 cte1.segment AS segment, unique_products_2020 AS product_count_2020, 
 unique_products_2021 AS product_count_2021, (unique_products_2021-unique_products_2020) AS difference  
FROM cte1, cte2
WHERE cte1.segment = cte2.segment
ORDER BY 4 DESC;