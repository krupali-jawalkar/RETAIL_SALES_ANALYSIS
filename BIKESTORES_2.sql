-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

Select COUNT(sale_date) AS SALE_DATE from [Retail Sales Analysis]
where sale_date = '2022-11-05'

Select *
from [Retail Sales Analysis]
where sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the 
-- quantity sold is more than 10 in the month of Nov-2022

SELECT * 
FROM [Retail Sales Analysis]
WHERE category = 'Clothing'
AND FORMAT(sale_date,'yyyy-MM') = '2022-11'
AND quantiy >=3

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
category,
SUM(total_sale) AS NET_SALE,
Count(*) AS Total_Orders
FROM [Retail Sales Analysis]
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT AVG(age) AS Average_Age
from [Retail Sales Analysis]
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM [Retail Sales Analysis] 
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
COUNT(*) AS Transactions,
gender,
category
FROM [Retail Sales Analysis]
GROUP BY gender, category
ORDER BY category

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year


SELECT 
year,
month,
avg_sale
FROM
(
SELECT 
YEAR (sale_date) as year,
MONTH (sale_date) as month,
avg(total_sale) AS avg_sale,
RANK () OVER(PARTITION BY YEAR(sale_date) ORDER BY avg(total_sale) DESC) AS RNK
from [Retail Sales Analysis] 
group by YEAR(sale_date), MONTH(sale_date)
) AS T1
WHERE RNK = 1

-- ORDER BY YEAR(sale_date	), avg(total_sale) DESC


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT TOP 5
customer_id,
SUM(total_sale) as highest_total_sale
FROM [Retail Sales Analysis]
GROUP BY customer_id 
ORDER BY SUM(total_sale) DESC


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
COUNT(DISTINCT customer_id) AS UNIQUE_CUSTOMER,
category
FROM [Retail Sales Analysis]
GROUP BY category

