SELECT * FROM [Retail Sales Analysis]

select count(*) from [Retail Sales Analysis]


----- DATA CLEANING 

--CHECK HOW MANY NULL VALUES ARE PRESENT IN THE DATA 

select * from [Retail Sales Analysis]
where 
transactions_id IS NULL
OR 
sale_date IS NULL
OR
sale_time	IS NULL
OR
customer_id	 IS NULL
OR
gender	IS NULL
OR
age	IS NULL
OR
category IS NULL	
OR
quantiy	IS NULL
OR
price_per_unit IS NULL
OR
cogs	IS NULL
OR
total_sale IS NULL


-- DELETE THE NULL VALUES SO THAT WE CAN ONLY HAVE VALUES WHICH ARE NOT NULL 

DELETE from [Retail Sales Analysis]
where 
transactions_id IS NULL
OR 
sale_date IS NULL
OR
sale_time	IS NULL
OR
customer_id	 IS NULL
OR
gender	IS NULL
OR
age	IS NULL
OR
category IS NULL	
OR
quantiy	IS NULL
OR
price_per_unit IS NULL
OR
cogs	IS NULL
OR
total_sale IS NULL

ALTER TABLE [Retail Sales Analysis]
ALTER COLUMN sale_time TIME


-- DATA EXPLORATION

-- HOW MANY DATA DO WE HAVE 

SELECT COUNT(*) AS TOTAL_SALES_DATA FROM [Retail Sales Analysis]

-- HOW MANY UNIQUE CUSTOMERS DO WE HAVE

SELECT COUNT(DISTINCT customer_id) AS CUSTOMER_COUNT
FROM [Retail Sales Analysis]

 
