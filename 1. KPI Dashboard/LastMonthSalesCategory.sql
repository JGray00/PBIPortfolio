SELECT
Category,
FORMAT(OrderDate,'yyyMM') as OrderDate,
FORMAT(OrderDate,'MMM-yyy') as OrderDate2,
SUM(LineTotal) As TotalSales
FROM [Sales].[vSalesSummary]

GROUP BY 
Category,
FORMAT(OrderDate,'yyyMM'),
FORMAT(OrderDate,'MMM-yyy')
order by FORMAT(OrderDate,'yyyMM') desc
