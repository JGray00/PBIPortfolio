SELECT
CAST(SalesOrderID as INT) as SalesOrderID,
CAST(OrderQty as INT) as Quantity,
CAST(ProductID as INT) as ProductID,
CAST(LineTotal as float) as Total

FROM [Sales].[SalesOrderDetail]
