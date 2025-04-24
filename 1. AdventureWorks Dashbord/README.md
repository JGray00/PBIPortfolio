# 1. AdventureWorks Dashboard
This report is intended to show skills with bringing in data from a relational database that is well structured and requires minimal manipulation. This represents a "best case scenario" workflow where data can be easily imported to PowerBI and using simple measures visualise the data in multiple ways and for multiple purposes.

Firstly, a schema was devloped externally from PowerBI, defining the fact and dimension tables and producing the following schema:

Then, the SQL queries included in this folder were used to import the tables to PowerBI. The SQL queries were structured in a particular manner in order to provide a consistent and self-annotating format. This is why for each field, the CAST function was used in order to explicitly declare the data type, meaning no conversion was required in Power Query, and an alias is always declared for each field. 

```sql
SELECT
CAST(SalesOrderID as INT) as SalesOrderID,
CAST(OrderQty as INT) as Quantity,
CAST(ProductID as INT) as ProductID,
CAST(LineTotal as float) as Total

FROM [Sales].[SalesOrderDetail]
```

The advantage of this process is that as much is done independent of PowerBI as possible which helps with the model's performance once imported to PowerBI. This has the potential to cause a performance hit when running the query, partiularly if the dataset is very large and there are issues with data quality and formatting, however the way around that is to create a view with this format and then query the view rather than the tables and even if that is not done, once the import is complete, no further performance hits should occur.

In addition to the SQL queries, a date reference table was created as well as an additional table for the purposes of filtering by a given month. These were created with DAX functions rather than in SQL due to the built in functions, however if a date reference table was in the database, then that could also be used. The DAX for these is given in the DAX formula file.
