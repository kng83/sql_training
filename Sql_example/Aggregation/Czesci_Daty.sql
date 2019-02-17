--Date part

Select * from Sales.SalesOrderHeader

--bierzemy czesci daty
SELECT DATEPART(QUARTER, OrderDate) AS Qtr,
 DATEPART(YEAR, OrderDate) AS Yr,
 DATEPART(Month, OrderDate) as Mth,
 DatePart(HOUR,OrderDate) as H,
 OrderDate,
 TotalDue
FROM Sales.SalesOrderHeader

