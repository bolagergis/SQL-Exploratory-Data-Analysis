# SQL Exploratory Data Analysis - Data Warehouse

My first SQL project where I explore a data warehouse and answer business questions using SQL queries.

## About This Project

This is my first attempt at working with SQL for data analysis. I followed along with the Data with Baraa tutorial series to build and explore a data warehouse. The project focuses on the Gold layer of the data warehouse, which contains cleaned and transformed data ready for analysis.

I used VS Code as my editor and connected to SQL Server to run these queries.

## What I Practiced

- Connecting to a SQL Server database
- Exploring database structure using information schema
- Writing queries to answer business questions
- Using joins, aggregations, and window functions
- Understanding the difference between dimensions and measures

## Database Structure

The data warehouse has a star schema with:

**Fact Table:**
- `gold.fact_sales` - Contains sales transactions

**Dimension Tables:**
- `gold.dim_products` - Product information
- `gold.dim_customers` - Customer information

## Project Sections

I organized my queries into these sections:

### 1. Dimensions vs Measures
Learned to identify:
- **Dimensions**: Categorical data for grouping (category, country, product_name)
- **Measures**: Numerical values to aggregate (sales_amount, quantity, price)

### 2. Database Exploration
Used `INFORMATION_SCHEMA` to discover tables and columns in the database.

### 3. Dimensions Exploration
Explored unique combinations of categories, subcategories, and products.

### 4. Date Exploration
Found:
- First and last order dates
- Range of years in the data
- Youngest and oldest customers

### 5. Measures Exploration
Created a summary report showing:
- Total sales
- Total quantity sold
- Average price
- Number of orders
- Number of products
- Number of customers

### 6. Magnitude Exploration
Analyzed data distribution by:
- Customers per country
- Customers by gender
- Products per category
- Revenue by category
- Revenue by customer
- Items sold per country

### 7. Ranking Exploration
Found:
- Top 5 products by revenue
- Worst 5 products by revenue

## Key Queries

Here are some examples of what I wrote:

**Finding total sales:**
```sql
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;
