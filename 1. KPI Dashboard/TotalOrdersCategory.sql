SELECT 
	Category,
	SUM(OrderQty) as TotalItems
FROM [Sales].[vSalesSummary]
GROUP BY Category
