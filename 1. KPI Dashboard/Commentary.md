# KPI Dashboard
For the KPI Dashboard, I identified the following KPIs:
- Total Sales
- Total Orders
- Total Sales by category
- Total Orders by category
- Total Sales by territory
- Total Orders by territory
- Average spend per order
- Average Order Size

For each KPI, the most recent month's performance will be shown, however there will also be a drill-down available in order to see the value of the KPI over time.
There will also be a lifetime value of each KPI shown to track long term achievement. The monthly or lifetime view will be controlled by a button on the page.

## SQL

I created a view using the following query (a copy of this is included in the files):
```
CREATE VIEW Sales.vSalesSummary AS

--intermediate table construction to have table of ProductIDs by Category
WITH cat as (SELECT
	Prod.ProductID,
	ProdCat.[Name] as Category
FROM [Production].[ProductSubcategory] ProdSub
JOIN Production.[Product] Prod on ProdSub.ProductSubcategoryID = Prod.ProductSubcategoryID
JOIN Production.ProductCategory ProdCat on ProdCat.ProductCategoryID = ProdSub.ProductCategoryID
),

--intermediate table contruction to join territory names to each sales order ID
terr as (SELECT
	SalesH.SalesOrderID,
	SalesH.OrderDate,
	terr.Territory
FROM [Sales].[SalesOrderHeader] SalesH
JOIN (
--this table streamlines the naming of the Territory, especially relating to US regions
SELECT
	TerritoryID,
	CASE WHEN [CountryRegionCode] = 'US' THEN CONCAT('United States - ',[Name])
	ELSE [Name] END as Territory
FROM [Sales].[SalesTerritory]) terr on SalesH.TerritoryID = terr.TerritoryID
)

SELECT 
SalesD.SalesOrderID,
OrderDate,
SalesD.OrderQty,
SalesD.LineTotal,
cat.Category,
terr.Territory

FROM Sales.SalesOrderDetail SalesD
JOIN cat on SalesD.ProductID = cat.ProductID
JOIN terr on SalesD.SalesOrderID = terr.SalesOrderID
```

and then this view was used to create particular summaries, the queries for which can be found in this folder.

## PowerBI
Firstly, each query was imported into PowerBI by connecting to the SQL server using the 'Import' Data Connectivity mode. The full dataset (i.e. the one put in to a view above) is also included for completeness, as some of the calculations done in the SQL queries could also have been done using DAX, which I have included as a secondary option.
