SELECT * FROM gold.dim_customers
SELECT * FROM gold.dim_products
SELECT * FROM gold.fact_sales

-- Retrieve a list of unique countries from which customers originate

SELECT DISTINCT cntry
FROM gold.dim_customers
ORDER BY cntry

-- Retrieve a list of unique categories,subcategory ,product_name from which customers originate

SELECT DISTINCT category,subcategory,product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
