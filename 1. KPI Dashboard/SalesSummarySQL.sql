CREATE VIEW Sales.vSaleSummary AS

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
format(terr.OrderDate,'dd/MM/yyyy') as OrderDate,
SalesD.OrderQty,
SalesD.LineTotal,
cat.Category,
terr.Territory

FROM Sales.SalesOrderDetail SalesD
JOIN cat on SalesD.ProductID = cat.ProductID
JOIN terr on SalesD.SalesOrderID = terr.SalesOrderID
