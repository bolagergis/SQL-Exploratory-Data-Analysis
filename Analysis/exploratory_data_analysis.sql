/*
=============================================================
Exploratory Data Analysis (EDA)
=============================================================
Purpose:
    Explore the Gold layer of the Data Warehouse
    and answer business questions using SQL.

Database:
    DataWarehouse

Author:
    Bola Gergis
=============================================================
*/

USE DataWarehouse;
GO

-- 1. Dimensions vs Measures
----------------------------
-- Dimension:
-- Describes or categorizes data.
-- Usually used for grouping/filtering.
-- Examples: category, product_name, country

select distinct Category FROM gold.dim_products;


select distinct Country  FROM gold.dim_customers;

-- Measure:
-- Numerical value that can be aggregated.
-- Examples: sales_amount, quantity,

select DISTINCT sales_amount
from gold.fact_sales;


select distinct quantity
from gold.fact_sales;

select distinct birthdate 
from gold.dim_customers;

-- ============================================
-- 2. Database Exploration
-- ============================================

-- Explore the tables available in the database
select * from information_schema.tables;

-- Explore the columns and their data types
select * from information_schema.columns;

-- ============================================
-- 3. Dimensions Exploration
-- ============================================

-- Explore the unique combinations between columns
select distinct category , subcategory from gold.dim_products;

select DISTINCT category, subcategory, product_name from gold.dim_products;

-- ============================================
-- 4. Date Exploration
-- ============================================

select * from gold.fact_sales;

-- Find the date ofthe first and the last order
-- How many years of sales are available
SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date,
    DATEDIFF(
        year,
        MIN(order_date),
        MAX(order_date)
    ) AS order_range_years
FROM gold.fact_sales;
 
-- find the youngest and the oldest customer 
select max(birthdate) as youngest_bithdate, 
datediff(year, max(birthdate), getdate()) as youngest_customer_age,
min(birthdate) as oldest_birthdate,
datediff(year, min(birthdate),getdate()) as oldest_customer_age
from gold.dim_customers;

------

select * from gold.fact_sales;

-- Find the total Sales
select sum(sales_amount) as total_sales
from gold.fact_sales;

-- Find how many items are sold

select sum(quantity) as total_items_sold
from gold.fact_sales;

-- Find the average selling price
select AVG(price) as Avg_price
from gold.fact_sales;

-- Find the total number of order
select COUNT(order_number) as Total_orders 
FROM gold.fact_sales;

-- to remove duplicate 
select COUNT(DISTINCT order_number)as Total_order
from gold.fact_sales;

-- Find the total number of orders
select COUNT(DISTINCT product_key) as Total_product
from gold.dim_products;

-- Find the total number of customers
select COUNT(customer_key) as Total_customers
from gold.dim_customers;

select * FROM gold.dim_products;

-- ============================================
-- 5. measures Exploration
-- ============================================


-- generate a report that shows all key metrics of the business
SELECT 'Total Sales'         AS measure_name, 
SUM(sales_amount)            AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity'      AS measure_name, 
SUM(quantity)                AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price'       AS measure_name, 
AVG(price)                   AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. orders'    AS measure_name, 
COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products'  AS measure_name, 
COUNT(DISTINCT product_name) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers' AS measure_name, 
COUNT(customer_key)          AS measure_value FROM gold.dim_customers;

-- ============================================
-- 6. Magnitude Exploration
-- ============================================

-- find total customers by countries
SELECT country, COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;

-- Find total customers by gender
SELECT gender , COUNT(DISTINCT customer_key) AS Customer_by_gender
FROM gold.dim_customers
GROUP BY gender
ORDER BY 2 DESC;

-- Find total products by category
SELECT category, COUNT(product_key) AS Total_product
FROM gold.dim_products
GROUP BY category
ORDER BY 2 DESC;

-- Whas ist he average costes in each category
SELECT category, AVG(cost) AS average_costs
FROM gold.dim_products
GROUP BY category
ORDER BY 2 DESC;

-- What ist he total revenue generated for each category
SELECT p.category,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- What is the total revenue generated by each customer?
SELECT
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS revenue_by_customer
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY revenue_by_customer DESC;
 
-- What ist he distribution of the sold items across countries?
SELECT
c.country,
SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC;


-- ============================================
-- 7. Ranking Exploration
-- ============================================

-- Which 5 products generatet he highest revenue?
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS highest_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY highest_sales DESC;

-- What are the worst-performing products in terms of sales?
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS Total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY Total_revenue ASC;

