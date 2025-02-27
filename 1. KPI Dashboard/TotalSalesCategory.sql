SELECT 
	Category,
	SUM([LineTotal]) as TotalSales
FROM [Sales].[vSalesSummary]
GROUP BY Category
