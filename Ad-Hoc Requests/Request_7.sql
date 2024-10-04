/* 7.Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month,Year,Gross sales Amount*/

SELECT 
       MONTHNAME(s.date) AS Month, 
       s.fiscal_year, 
       SUM(s.sold_quantity*g.gross_price) AS Gross_sales_Amount 
FROM fact_sales_monthly s 
JOIn fact_gross_price g
   ON s.product_code = g.product_code
JOIN dim_customer c
   ON s.customer_code = c.customer_code
WHERE c.customer = 'Atliq Exclusive'
GROUP BY 1,2;