SELECT top 1
FORMAT(OrderDate,'yyyMM') as OrderDate,
FORMAT(OrderDate,'MMM-yyy') as OrderDate2,
FORMAT(SUM(LineTotal)/COUNT(DISTINCT([SalesOrderID])),'C2') as AverageOrder
FROM [Sales].[vSalesSummary]

GROUP BY 
FORMAT(OrderDate,'yyyMM'),
FORMAT(OrderDate,'MMM-yyy')
order by FORMAT(OrderDate,'yyyMM') desc
