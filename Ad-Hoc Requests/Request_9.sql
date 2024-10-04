/*
9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

WITH cte1 AS (SELECT c.channel, ROUND(SUM(g.gross_price * s.sold_quantity/1000000),2) channel_gross_sales_mln
              FROM fact_sales_monthly s
              JOIN dim_customer c ON s.customer_code = c.customer_code
              JOIN fact_gross_price g ON s.product_code = g.product_code
              WHERE s.fiscal_year = 2021
              GROUP BY 1),
	 cte2 AS (SELECT SUM(channel_gross_sales_mln) total_gross_sales_mln FROM cte1)	
SELECT CHANNEL, CONCAT(channel_gross_sales_mln, ' M') gross_sales_mln, 
CONCAT(ROUND(channel_gross_sales_mln/total_gross_sales_mln*100,2), ' %') percent_contribution
FROM cte1, cte2
ORDER BY 3 DESC;