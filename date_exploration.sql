-- Determin the first and last order date and total duration in month 
SELECT 
MIN (order_date) AS First_order_date,
MAX (order_date) AS Last_order_date,
DATEDIFF(month,MIN (order_date),MAX (order_date) ) AS Duration_in_months

FROM gold.fact_sales

-- Find the youngest and oldest customer based on birthdate
SELECT 
MIN(bdate) AS youngest_coustomer,
DATEDIFF(YEAR,MIN(bdate),GETDATE()) AS Oldest_customer_age,
MAX(bdate) AS Oldest_customer,
DATEDIFF(YEAR,MAX(bdate),GETDATE()) AS Oldest_customer_age
 FROM gold.dim_customers