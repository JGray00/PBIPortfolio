SELECT
CAST(TerritoryID as INT) as TerritoryID,
CASE
	WHEN [Group] = 'North America' THEN CAST(CONCAT(CountryRegionCode,'-',[Name]) as varchar) 
	ELSE CAST([Name] as varchar)
	END as TerritoryName,
Cast([Group] as varchar) as TerritoryGroup

FROM [Sales].[SalesTerritory]
