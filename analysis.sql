-- SkillNexis Internship Week 2
-- SQL Sales Data Analysis

USE skillnexis_sales;

-- 1. View all sales records
SELECT * FROM sales_data;

-- 2. Total number of records
SELECT COUNT(*) AS total_records
FROM sales_data;

-- 3. Total revenue
SELECT SUM(total_price) AS total_revenue
FROM sales_data;

-- 4. Average order value
SELECT AVG(total_price) AS average_order_value
FROM sales_data;

-- 5. Sales by category
SELECT category, SUM(total_price) AS total_sales
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- 6. Sales above 10000
SELECT *
FROM sales_data
WHERE total_price > 10000;

-- 7. Top 5 customers by total spending
SELECT customer_name, SUM(total_price) AS total_spent
FROM sales_data
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 8. Classify sales by order value
SELECT `ï»¿order_id`, total_price,
    CASE
        WHEN total_price >= 10000 THEN 'High'
        WHEN total_price >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_level
FROM sales_data;

-- 9. Sales above the average order value
SELECT customer_name, total_price
FROM sales_data
WHERE total_price > (
    SELECT AVG(total_price)
    FROM sales_data
)
ORDER BY total_price DESC;



