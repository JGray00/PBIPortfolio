SELECT
CAST(Prod.ProductID as int) as [ProductID],
CAST(Prod.Name as varchar) as ProductName,
CASE 
	WHEN ProdSub.Name is null THEN CAST('Other' as varchar) 
	ELSE CAST(ProdSub.Name as varchar)
END as Subcategory,
CASE
	WHEN ProdCat.Name is null THEN CAST('Other' as varchar) 
	ELSE CAST(ProdCat.Name as varchar)
END as Category

FROM [Production].[ProductSubcategory] ProdSub
FULL JOIN Production.[Product] Prod on ProdSub.ProductSubcategoryID = Prod.ProductSubcategoryID
FULL JOIN Production.ProductCategory ProdCat on ProdCat.ProductCategoryID = ProdSub.ProductCategoryID
