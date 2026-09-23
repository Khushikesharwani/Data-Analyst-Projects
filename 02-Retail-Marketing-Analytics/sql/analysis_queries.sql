-- ---------------------------------------------------------
-- 1. Total Sales by Region
-- Business Question:
--    Which regions generate the highest sales?
--
-- Why:
--    Helps target marketing and resource allocation
-- ---------------------------------------------------------
SELECT Region, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;

-- ---------------------------------------------------------
-- 2. Profit by Product Category
-- Business Question:
--    Which product categories generate the most profit?
--
-- Why:
--    Informs product strategy and focus
-- ---------------------------------------------------------
SELECT P.Category, SUM(O.Profit) AS TotalProfit
FROM Orders O 
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.Category
ORDER BY TotalProfit DESC;

-- ---------------------------------------------------------
-- 3. Monthly Sales Trend
-- Business Question:
--    What is the total sales trend over time, by month?
--
-- Why:
--    Identifies seasonality and sales cycles
-- ---------------------------------------------------------
SELECT
  DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
  SUM(Sales) AS TotalSales
FROM
  Orders
GROUP BY
  DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY
  Month;

-- ---------------------------------------------------------
-- 4. Top 10 Customers by Total Sales
-- Business Question:
--    Who are our highest-value customers?
--
-- Why:
--    Supports targeted sales and retention strategies
-- ---------------------------------------------------------
SELECT C.CustomerName, SUM(O.Sales) AS TotalSales
FROM Orders O 
JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 10;

-- ---------------------------------------------------------
-- 5. Average Discount by Region
-- Business Question:
--    What is the average discount given in each region?
--
-- Why:
--    Helps evaluate discount strategies regionally
-- ---------------------------------------------------------
SELECT Region, AVG(Discount) AS AvgDiscount
FROM Orders
GROUP BY Region;

-- ---------------------------------------------------------
-- 6. Profit by Category and Subcategory
-- Business Question:
--    Which product subcategories are most profitable?
--
-- Why:
--    Supports detailed product portfolio decisions
-- ---------------------------------------------------------
SELECT
  P.Category,
  P.Subcategory,
  ROUND(SUM(O.Profit), 2) AS TotalProfit
FROM
  Orders O
JOIN
  Products P ON O.ProductID = P.ProductID
GROUP BY
  P.Category, P.Subcategory
ORDER BY
  TotalProfit DESC;

-- ---------------------------------------------------------
-- 7. Top 10 Customers by Total Sales (Repeat for Emphasis)
-- Business Question:
--    Who are our top customers overall?
--
-- Note:
--    This query duplicates #4 but is useful to keep if showcasing variations
-- ---------------------------------------------------------
SELECT
  C.CustomerName,
  ROUND(SUM(O.Sales), 2) AS TotalSales
FROM
  Orders O
JOIN
  Customers C ON O.CustomerID = C.CustomerID
GROUP BY
  C.CustomerName
ORDER BY
  TotalSales DESC
LIMIT 10;

-- ---------------------------------------------------------
-- 8. Monthly Profit Trend
-- Business Question:
--    How does profit vary month by month?
--
-- Why:
--    Reveals seasonality in profitability
-- ---------------------------------------------------------
SELECT
  DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
  ROUND(SUM(Profit), 2) AS TotalProfit
FROM
  Orders
GROUP BY
  Month
ORDER BY
  Month;

-- ---------------------------------------------------------
-- 9️. Discount Impact on Profit
-- Business Question:
--    How do different discount rates impact total profit?
--
-- Why:
--    Helps evaluate pricing/discount effectiveness
-- ---------------------------------------------------------
SELECT
  ROUND(Discount, 2) AS DiscountRate,
  ROUND(SUM(Profit), 2) AS TotalProfit,
  COUNT(*) AS OrderCount
FROM
  Orders
GROUP BY
  DiscountRate
ORDER BY
  DiscountRate;

-- ---------------------------------------------------------
-- 10. Sales and Profit by Customer Segment and Region
-- Business Question:
--    Which customer segments and regions generate the most sales and profit?
--
-- Why:
--    Informs targeted marketing and regional strategy
-- ---------------------------------------------------------
SELECT
  C.Segment,
  O.Region,
  ROUND(SUM(O.Sales), 2) AS TotalSales,
  ROUND(SUM(O.Profit), 2) AS TotalProfit
FROM
  Orders O
JOIN
  Customers C ON O.CustomerID = C.CustomerID
GROUP BY
  C.Segment, O.Region
ORDER BY
  TotalSales DESC;

-- ---------------------------------------------------------
-- 11. Average Order Value by Customer Segment
-- Business Question:
--    What is the average order value across customer segments?
--
-- Why:
--    Identifies high-value segments to prioritize
-- ---------------------------------------------------------
SELECT
  C.Segment,
  ROUND(SUM(O.Sales) / COUNT(DISTINCT O.OrderID), 2) AS AvgOrderValue
FROM
  Orders O
JOIN
  Customers C ON O.CustomerID = C.CustomerID
GROUP BY
  C.Segment
ORDER BY
  AvgOrderValue DESC;

-- ---------------------------------------------------------
-- 12. Best-Selling Products
-- Business Question:
--    Which products generate the most sales and units sold?
--
-- Why:
--    Guides inventory planning and promotions
-- ---------------------------------------------------------
SELECT
  P.ProductName,
  ROUND(SUM(O.Sales), 2) AS TotalSales,
  SUM(O.Quantity) AS TotalUnitsSold
FROM
  Orders O
JOIN
  Products P ON O.ProductID = P.ProductID
GROUP BY
  P.ProductName
ORDER BY
  TotalSales DESC
LIMIT 10;

-- ---------------------------------------------------------
-- 13. Orders with Negative Profit
-- Business Question:
--    Which orders lost money?
--
-- Why:
--    Identifies pricing or discount issues
-- ---------------------------------------------------------
SELECT
  O.OrderID,
  O.ProductID,
  O.Quantity,
  O.Sales,
  O.Discount,
  O.Profit
FROM
  Orders O
WHERE
  O.Profit < 0
ORDER BY
  O.Profit ASC;

-- ---------------------------------------------------------
-- 14. Customer Lifetime Value (CLV)
-- Business Question:
--    What is the total sales value for each customer?
--
-- Why:
--    Supports loyalty programs and sales targeting
-- ---------------------------------------------------------
SELECT
  C.CustomerID,
  C.CustomerName,
  ROUND(SUM(O.Sales), 2) AS CustomerLifetimeValue
FROM
  Orders O
JOIN
  Customers C ON O.CustomerID = C.CustomerID
GROUP BY
  C.CustomerID, C.CustomerName
ORDER BY
  CustomerLifetimeValue DESC;

-- ---------------------------------------------------------
-- 15. Yearly Sales and Profit Trend
-- Business Question:
--    How have sales and profit grown over time (yearly)?
--
-- Why:
--    Tracks business growth and performance
-- ---------------------------------------------------------
SELECT
  YEAR(OrderDate) AS Year,
  ROUND(SUM(Sales), 2) AS TotalSales,
  ROUND(SUM(Profit), 2) AS TotalProfit
FROM
  Orders
GROUP BY
  Year
ORDER BY
  Year;



