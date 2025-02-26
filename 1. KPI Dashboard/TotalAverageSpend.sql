SELECT 
FORMAT(SUM(LineTotal)/COUNT(DISTINCT([SalesOrderID])),'C2') as AverageOrder
FROM [Sales].[vSalesSummary]
