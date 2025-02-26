IF OBJECT_ID('tempdb..#tmp1') IS NOT NULL
    DROP TABLE #tmp1

SELECT
SalesOrderID,
OrderDate,
SUM(OrderQty) as OrderSize

into #tmp1

FROM [Sales].[vSalesSummary]
GROUP BY SalesOrderID,OrderDate

SELECT
FORMAT(OrderDate,'yyyMM') as OrderDate,
FORMAT(OrderDate,'MMM-yyy') as OrderDate2,
AVG(OrderSize) as OrderSize
FROM #tmp1

GROUP BY 
FORMAT(OrderDate,'yyyMM'),
FORMAT(OrderDate,'MMM-yyy')
order by FORMAT(OrderDate,'yyyMM') desc
