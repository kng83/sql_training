--Subqueries . Jest lista inner i outer . Najpierw raz jest wykonywana inner i 
-- jest ona wsadem pozniej do outer queries

Select top 1 * from Sales.SalesOrderHeader;

--to daje error
Select SalesOrderID, Max(TotalDue)
From Sales.SalesOrderHeader;

--to jest query do szukania max wartosci
Select SalesOrderID, Max(TotalDue) as AbsoluteMax
From Sales.SalesOrderHeader
Group By SalesOrderId
Order by Max(TotalDue) DESC;

--Robimy subqueries i umieszczamy w klauzuli where
--Otrzymujemy najwieksza wartosc kolumny TotalDue i jej id
Select SalesOrderID, TotalDue from Sales.SalesOrderHeader
Where TotalDue = (Select  Max(TotalDue) From Sales.SalesOrderHeader);
