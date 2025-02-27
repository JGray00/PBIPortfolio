SELECT 
	Territory,
	SUM([LineTotal]) as TotalSales
FROM [Sales].[vSalesSummary]
GROUP BY Territory
