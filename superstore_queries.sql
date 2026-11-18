-- =====================================================================
-- Retail Sales Analytical Dashboard — SQL Server (T-SQL) Queries
-- Dataset: Sample Superstore (9,994 rows, 21 columns)
-- Author: Ritika Mishra
-- =====================================================================

-- Row count and schema check
SELECT COUNT(*) AS TotalRows
FROM Superstore;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstore';

-- =====================================================================
-- Business KPIs
-- =====================================================================

-- Total Sales
SELECT
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore;

-- Total Profit
SELECT
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS TotalOrders
FROM Superstore;

-- Average Order Value
SELECT
    ROUND(
        SUM(Sales) /
        COUNT(DISTINCT Order_ID),
    2) AS AverageOrderValue
FROM Superstore;

-- Overall Profit Margin
SELECT
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
    2) AS ProfitMargin
FROM Superstore;

-- =====================================================================
-- Category & Sub-Category Analysis
-- =====================================================================

-- Category Analysis
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(AVG(Discount) * 100.0, 2) AS AvgDiscount,
    ROUND((SUM(Profit) * 100.0) / SUM(Sales), 2) AS ProfitMargin
FROM Superstore
GROUP BY Category
ORDER BY ProfitMargin DESC;

-- Sub-Category Analysis
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(
        SUM(Profit) * 100.0 /
        SUM(Sales),
    2) AS ProfitMargin
FROM Superstore
GROUP BY Sub_Category
ORDER BY ProfitMargin DESC;

-- Avg Discount by Sub-Category
SELECT
    Sub_Category,
    ROUND(AVG(Discount) * 100.0, 2) AS AvgDiscount
FROM Superstore
GROUP BY Sub_Category
ORDER BY AvgDiscount DESC;

-- Most Profitable Sub-Category
SELECT TOP 1
    Sub_Category,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Sub_Category
ORDER BY TotalProfit DESC;

-- Least Profitable Sub-Category
SELECT TOP 1
    Sub_Category,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Sub_Category
ORDER BY TotalProfit ASC;

-- Category with Sales > 700,000 (demonstrates HAVING on an aggregate)
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore
GROUP BY Category
HAVING SUM(Sales) > 700000
ORDER BY TotalSales DESC;

-- Products with Negative Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY TotalProfit;

-- =====================================================================
-- Regional & Geographic Analysis
-- =====================================================================

-- Regional Analysis
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Region
ORDER BY TotalSales DESC;

-- State Analysis
SELECT
    State,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY State
ORDER BY TotalSales DESC;

-- =====================================================================
-- Customer & Product Analysis
-- =====================================================================

-- Top 10 Customers by Sales
SELECT TOP 10
    Customer_Name,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- Top 10 Products by Sales
SELECT TOP 10
    Product_Name,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Product_Name
ORDER BY TotalSales DESC;

-- Customers with More Than 10 Distinct Orders
SELECT
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS TotalOrders
FROM Superstore
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 10
ORDER BY TotalOrders DESC;

-- Customer Segment Analysis
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM Superstore
GROUP BY Segment
ORDER BY TotalSales DESC;

-- =====================================================================
-- Shipping Analysis
-- =====================================================================

SELECT
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore
GROUP BY Ship_Mode
ORDER BY TotalSales DESC;

-- =====================================================================
-- Time-Based / Seasonality Analysis
-- =====================================================================

-- Year-Wise Sales
SELECT
    YEAR(Order_Date) AS OrderYear,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore
GROUP BY YEAR(Order_Date)
ORDER BY OrderYear;

-- Month-Wise Sales (seasonality, all years combined)
SELECT
    MONTH(Order_Date) AS MonthNo,
    DATENAME(MONTH, Order_Date) AS MonthName,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore
GROUP BY
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY MonthNo;

-- Top Sales Month
SELECT TOP 1
    MONTH(Order_Date) AS MonthNo,
    DATENAME(MONTH, Order_Date) AS MonthName,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM Superstore
GROUP BY
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY TotalSales DESC;

-- Year-Month Wise Growth Rate (month-over-month, % change)
-- Note: earliest month will show NULL since there is no prior month to compare.
SELECT
    YEAR(Order_Date) AS OrderYear,
    MONTH(Order_Date) AS MonthNo,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(
        (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)))
        * 100.0 / LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)),
    2) AS GrowthRatePercent
FROM Superstore
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY OrderYear, MonthNo;
