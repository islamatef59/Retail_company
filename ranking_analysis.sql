-- Which 5 products Generating the Highest Reve
SELECT TOP 5
	 P.product_name,
	SUM(f.sales_amount) AS total_revenu
FROM gold.fact_sales F
	LEFT JOIN gold.dim_products p
	ON f.product_key=p.product_key
	GROUP BY P.product_name
	ORDER BY total_revenu DESC

SELECT * FROM gold.fact_sales
--Ranking Using Window Functions
SELECT* 
FROM(
SELECT
	 P.product_name,
	SUM(f.sales_amount) AS total_revenu,
	RANK() OVER(ORDER BY SUM(f.sales_amount) DESC) AS Rank_products
	FROM gold.fact_sales F
	LEFT JOIN gold.dim_products p
	ON f.product_key=p.product_key
	GROUP BY P.product_name
	) AS ranked_products
	WHERE Rank_products <=5

-- What are the 5 worst-performing products in terms of sales?
SELECT TOP 5
	 P.product_name,
	SUM(f.sales_amount) AS total_revenu
FROM gold.fact_sales F
	LEFT JOIN gold.dim_products p
	ON f.product_key=p.product_key
	GROUP BY P.product_name
	ORDER BY total_revenu 

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
	c.customer_key,
	c.cst_firstname,
	c.cst_lastname,
	SUM(f.sales_amount) AS Revenu
FROM gold.dim_customers c
	LEFT JOIN gold.fact_sales f
	ON c.customer_key=f.customer_key
	GROUP BY c.customer_key, c.cst_firstname, c.cst_lastname
	ORDER BY Revenu DESC

-- The 3 customers with the fewest orders placed
SELECT  TOP 3
	c.customer_key,
	c.cst_firstname,
	c.cst_lastname,
	COUNT(DISTINCT f.order_number) AS orders_palced
FROM gold.dim_customers c
	LEFT JOIN gold.fact_sales f
	ON c.customer_key=f.customer_key
	GROUP BY c.customer_key, c.cst_firstname, c.cst_lastname
	ORDER BY orders_palced 
