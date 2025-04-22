SELECT
CAST(SalesOrderID as INT) as SalesOrderID,
CAST(OrderDate as date) as OrderDate,
CAST(FORMAT(OrderDate, 'yyyMM') as varchar) as OrderYearMonth,
CAST(FORMAT(OrderDate, 'MMM-yyy') as varchar) as OrderMonthYear,
CAST(OnlineOrderFlag as INT) as OnlineOrderFlag,
CAST(TerritoryID as INT) as TerritoryID,
CAST(TaxAmt+Freight as float) as OtherCosts

FROM [Sales].[SalesOrderHeader]
