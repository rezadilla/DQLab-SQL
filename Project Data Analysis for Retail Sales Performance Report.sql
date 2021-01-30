USE dqlab;


-- OVERALL PERFORMANCE BY YEAR (Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years).)
SELECT
	YEAR(order_date) AS years,
	ROUND(SUM(sales), 2) AS sales,
	COUNT(order_id) AS number_of_order
FROM
	dqlab_sales_store
WHERE
	order_status = 'Order Finished'
GROUP BY
	years;
	
-- OVERALL PERFORMANCE BY PRODUCT SUB CATEGORY (Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) berdasarkan sub category dari produk (product_sub_category) pada tahun 2011 dan 2012 saja (years))
SELECT
	YEAR(order_date) AS years,
	product_sub_category,
	SUM(sales) AS sales
FROM
	dqlab_sales_store
WHERE 
	YEAR(order_date) BETWEEN 2011
	AND 2012
	AND order_status LIKE 'Order Finished'
GROUP BY
	years,
	product_sub_category
ORDER_BY
	years,
	sales DESC;
	
-- PROMOTION EFFECTIVENESS AND EFFICIENCY BY YEARS
SELECT
    YEAR(order_date) AS years,
    SUM(sales) AS sales,
    SUM(discount_value) AS promotion_value,
    ROUND(SUM(discount_value) / SUM(sales) * 100, 2) as burn_rate_percentage
FROM
    dqlab_sales_store
WHERE
    YEAR(order_date) BETWEEN 2009
    AND 2012
    AND order_status LIKE 'Order Finished'
GROUP BY
    years
ORDER BY
    years;

-- PROMOTION EFFECTIVENESS AND EFFICIENCY BY PRODUCT SUB CATEGORY
SELECT
	YEAR(order_date) AS years,
	product_sub_category,
	product_category,
	SUM(sales) AS sales,
	SUM(discount_value) AS promotion_value,
	ROUND(SUM(discount_value)/ SUM(sale) * 100, 2) as burn_rate_percentage
FROM
	dqlab_Sales_store,
WHERE
	YEAR(order_date) = 2012
	AND order_status LIKE 'Order Finished'
GROUP BY
	years,
	product_sub_category,
	product_category
ORDER BY
	sales DESC;
	

-- CUSTOMER TRANSACTIONS PER YEAR
SELECT
	YEAR(ordes_date) AS years,
	COUNT(DISTINCT customer) AS number_of_customer
FROM
	dqlab_sales_store
WHERE
	YEAR(order_date) BETWEEN 2009
	AND 2012
	AND order_status LIKE 'Order Finished'
GROUP BY
	years;





















	
	
	