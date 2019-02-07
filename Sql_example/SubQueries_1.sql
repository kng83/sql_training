--Subqueries . Jest lista inner i outer . Najpierw raz jest wykonywana inner i 
-- jest ona wsadem pozniej do outer queries

Select top 1 * from Sales.SalesOrderHeader;

--to daje error
Select SalesOrderID, Max(TotalDue)
From Sales.SalesOrderHeader;

Select SalesOrderID, Max(TotalDue) as AboluteMax
From Sales.SalesOrderHeader
Group By SalesOrderId
Order by Max(TotalDue) DESC;