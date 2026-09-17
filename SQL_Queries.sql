USE  ecommerce;

SELECT * FROM orders;


-- 1 Sales Overview

-- Total orders 
SELECT COUNT(*) AS Total_Orders  FROM orders; 

-- Total Sales
SELECT SUM(Net_Amount)  AS Total_Sales FROM orders;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit FROM orders;

-- Average Order Value
SELECT ROUND(SUM(Net_amount)/COUNT(*),2) 
AS Average_Order_Value 
FROM orders;

-- Profit Margin
SELECT ROUND(SUM(profit)/SUM(Net_amount)*100,2) 
AS profit_Margin
FROM orders;


-- 2 Product Analysis

-- Top Products
SELECT Product, sum(Net_Amount) AS Sales
 FROM orders
 GROUP BY Product
 ORDER BY Sales DESC;
 
-- Bottom 5 Products

SELECT Product, SUM(Net_Amount) AS Sales
 FROM orders
 GROUP BY Product
 ORDER BY Sales ASC
 LIMIT 5;
 
 -- Profit by Product
 
 SELECT Product,SUM(Profit) AS Profit
 FROM orders
 GROUP BY Product
 ORDER BY Profit DESC;

-- Quantity Sold by Product

SELECT Product, SUM(Qty) AS Quantity_Sold
FROM orders
GROUP BY Product
ORDER BY Quantity_Sold DESC;

-- Highest Discounted Products

SELECT Product, ROUND(AVG(Discount),2) AS 	Avg_Discount 
FROM orders
GROUP BY Product
ORDER BY Avg_Discount DESC;

-- 3 Category Analysis

-- Sales by Category

SELECT Category, SUM(Net_Amount)  AS Sales
FROM orders
GROUP BY Category
ORDER BY Sales DESC;


-- Profit by Category

SELECT Category, SUM(Net_Amount) AS Profit
FROM orders
GROUP BY Category
ORDER BY Profit DESC;


-- Quantity Sold by Category

SELECT Category, SUM(qty) AS  Quantity 
FROM orders
GROUP BY Category
ORDER BY Quantity DESC;


-- 4 Customer & City Analysis


 -- Top 5 Cities
 
 SELECT City, SUM(net_amount) AS Sales
 FROM orders
 GROUP BY City
 ORDER BY Sales DESC
 LIMIT 5;
 
-- Bottom 5 Cities

SELECT city, SUM(Net_Amount)  AS Sales 
FROM orders
GROUP BY City
ORDER BY Sales ASC
LIMIT 5;

-- Orders by City

SELECT city,COUNT(*) AS Orders 
FROM orders
GROUP BY city
ORDER BY Orders DESC;


-- Average Order Value by City

SELECT city, ROUND(AVG(Net_Amount),2) AS Avg_Order_Value
FROM orders
GROUP BY city
ORDER BY Avg_Order_Value DESC;

--  5 Time Analysis


 -- Monthly Sales
 
SELECT Month, SUM(Net_Amount) AS Sales
FROM orders
GROUP BY Month;


-- Monthly Profit
SELECT Month, SUM(Profit) AS Profit
FROM orders
GROUP BY Month
ORDER BY Profit DESC;


-- Monthly Orders

SELECT Month, COUNT(*) AS Orders
FROM orders
GROUP BY Month
ORDER BY orders DESC;

-- 6 Payment Analysis

-- Sales by Payment Type

SELECT Payment_Type, SUM(Net_Amount) AS Sales 
FROM orders
GROUP BY Payment_Type
ORDER BY sales DESC;

-- Orders by Payment Type

SELECT Payment_Type, COUNT(*) AS Orders
FROM orders
GROUP BY Payment_Type;


-- 7 Order Status Analysis

SELECT Order_Status,COUNT(*) AS Orders
FROM orders
GROUP BY Order_Status;

-- Returned Orders Percentage

SELECT ROUND(COUNT(CASE WHEN Order_Status = 'Returned' THEN 1 END)* 100.0)/ COUNT(*),2 AS Return_Rate
FROM orders;


-- Profit Lost in Returned Orders

SELECT SUM(Profit) AS Returned_Profit_Loss
FROM orders
WHERE Order_Status='Returned';


