SELECT 
SUM(LineTotal)/COUNT(DISTINCT([SalesOrderID])) as AverageOrder
FROM [Sales].[vSalesSummary]
