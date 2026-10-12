# SQL Exploratory Data Analysis - Data Warehouse

My first SQL project where I explore a data warehouse and answer business questions using SQL queries.

## About This Project

This is my first attempt at working with SQL for data analysis. I followed along with the Data with Baraa tutorial series to build and explore a data warehouse. The project focuses on the Gold layer of the data warehouse, which contains cleaned and transformed data ready for analysis.

I used VS Code as my editor and connected to SQL Server to run these queries.


## Project Objectives

- Explore and understand the structure of the Data Warehouse.
- Analyze customer, product, and sales data using SQL.
- Calculate key business metrics and performance indicators.
- Identify sales trends and compare performance across products, categories, customers, and countries.
- Practice SQL techniques used in real-world data analysis.

## Tools & Technologies

- SQL Server: Querying and analyzing data.
- Visual Studio Code (VS Code): Writing and executing SQL queries.
- Docker Desktop: Running SQL Server in a containerized environment.
- GitHub: Version control and project documentation


## What I Practiced

- Connecting to a SQL Server database
- Exploring database structure using information schema
- Writing queries to answer business questions
- Using joins, aggregations, and window functions
- Understanding the difference between dimensions and measures
- Build reusable SQL reports to support data-driven decision-making



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

## Learning Context
This project was developed as a hands-on learning project while following The Complete SQL Bootcamp:SQL Exploratory Data Analysis Projekt
