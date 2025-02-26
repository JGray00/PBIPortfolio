SELECT 
	Territory,
	COUNT(DISTINCT([SalesOrderID])) as TotalOrders
FROM [Sales].[vSalesSummary]
GROUP BY Territory
