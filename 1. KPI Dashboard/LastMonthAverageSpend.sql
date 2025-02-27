SELECT
FORMAT(OrderDate,'yyyMM') as OrderDate,
FORMAT(OrderDate,'MMM-yyy') as OrderDate2,
SUM(LineTotal)/COUNT(DISTINCT([SalesOrderID])) as AverageOrder
FROM [Sales].[vSalesSummary]

GROUP BY 
FORMAT(OrderDate,'yyyMM'),
FORMAT(OrderDate,'MMM-yyy')
order by FORMAT(OrderDate,'yyyMM') desc
