# Business KPI Dashboard
For the KPI Dashboard, I identified the following KPIs:
- Total sales
- Total orders
- Total items sold
- Total Sales by category
- Total Sales by territory
- Total Orders by territory
- Total items sold by category
- Average spend per order
- Average order size

For each KPI, the most recent month's performance will be shown, however there will also be a link available in order to see the value of the KPI over time.
There will also be a lifetime value of each KPI shown to track long term achievement.

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
Firstly, each query was imported into PowerBI by connecting to the SQL server using the 'Import' Data Connectivity mode. The full dataset (i.e. the one put in to a view above) is also included for completeness, as some of the visuals could be done better through single dataset.

![image](https://github.com/user-attachments/assets/765feaef-4477-449a-9b30-8bbe8f58e1c1)
![image](https://github.com/user-attachments/assets/75f3e7e3-c4e9-480c-aa0b-67001a6ded2e)


This is a screenshot of the final report, as well as a screenshot of the separate monthly trend page. This layout was also duplicated to show interconnected visuals from a single dataset.

Some methods of filtering and organising data (particularly with dates) was done in a way that is not typical in a real life setting as the data is only until 2014 and so filtering by the past month is not as easily done when looking at historic viewpoints (for example, a filter of "last 1 month" would not work with data like this). Typically a filter would be used if data from a particular month was intended to be viewed.

Some of the visualisations in the second version of the report use the queries produced for the first version, particularly the averages due to the more complex nature of calculating from a single dataset using DAX and in a real life setting a separate SQL query would be used.

The second version of the report is my preferred method largely due to the more interconnected nature of the data, allowing for multidimensionality (as can be seen when looking at category sales by region, for example).
