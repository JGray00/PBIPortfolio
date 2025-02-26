SELECT 
	Territory,
	FORMAT(SUM([LineTotal]),'C2') as TotalSales
FROM [Sales].[vSalesSummary]
GROUP BY Territory
