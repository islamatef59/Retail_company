/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

	*/
-- Which categories contribute the most to overall sales?
SELECT * FROM gold.dim_products
SELECT * FROM gold.dim_customers
SELECT * FROM gold.fact_sales

WITH category_sales AS (
SELECT 
	p.category ,
	SUM(CAST(f.sales_amount AS BIGINT)) AS total_sales
FROM gold.fact_sales f
LEFT JOIN  gold.dim_products p
	ON p.product_key=f.product_key
GROUP BY p.category
)

SELECT 
category,
SUM(total_sales) OVER() AS overall_sales,
ROUND((CAST(total_sales AS FLOAT)/SUM(total_sales) OVER())*100,2) AS category_percentage
FROM category_sales
ORDER BY overall_sales DESC
