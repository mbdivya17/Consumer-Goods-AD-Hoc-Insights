/*
8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

SELECT
   CASE WHEN month(date) in (9,10,11) THEN 'q1'
        WHEN month(date) in (12,1,2) THEN 'q2'
        WHEN month(date) in (3,4,5) THEN 'q3'
   ELSE 'q4'
END AS quarters,
SUM(sold_quantity) total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY 1
ORDER BY 2 DESC;

