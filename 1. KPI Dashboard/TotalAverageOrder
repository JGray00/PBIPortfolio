IF OBJECT_ID('tempdb..#tmp1') IS NOT NULL
    DROP TABLE #tmp1

SELECT
SalesOrderID,
SUM(OrderQty) as OrderSize

into #tmp1

FROM [Sales].[vSalesSummary]
GROUP BY SalesOrderID


SELECT 
AVG(OrderSize)
FROM #tmp1
