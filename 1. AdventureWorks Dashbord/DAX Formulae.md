### Table 1 - dimDates
```
dimDates = CALENDAR(min(Sales[OrderDate]),max(Sales[OrderDate]))      -- a list of all dates based on the date range contained within the OrderDate field of the Sales table.
YearMonth = STARTOFMONTH(dimDates[Date])      -- This creates a value which relates to the dimYearMonth table
```
### Table 2 - dimYearMonth
```
dimYearMonth = DISTINCT(dimDates[YearMonth])      -- Creates a list of unique Month and Year values for the purposes of filtering data for a given month.
```
### Measure 1 - AverageOrder
```
AverageOrder = SUM(SalesDetail[Quantity])/COUNT(Sales[SalesOrderID])
```
### Measure 2 - AverageSale
```
AverageSale = (SUM(SalesDetail[Total])+SUM(Sales[OtherCosts]))/COUNT(Sales[SalesOrderID])
```
### Measure 3 - TotalItemsSold
```
TotalItemsSold = SUM(SalesDetail[Quantity])
```
### Measure 4 - TotalOrders
```
TotalOrders = COUNT(Sales[SalesOrderID])
```
### Measure 5 - TotalSales
```
TotalSales = SUM(SalesDetail[Total])
```
