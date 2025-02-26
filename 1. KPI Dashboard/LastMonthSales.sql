SELECT top 1 WITH TIES
FORMAT(OrderDate,'yyyMM') as OrderDate,
FORMAT(OrderDate,'MMM-yyy') as OrderDate2,
FORMAT(SUM(LineTotal),'C2') As TotalSales
FROM [Sales].[vSalesSummary]

GROUP BY 
FORMAT(OrderDate,'yyyMM'),
FORMAT(OrderDate,'MMM-yyy')
order by FORMAT(OrderDate,'yyyMM') desc
