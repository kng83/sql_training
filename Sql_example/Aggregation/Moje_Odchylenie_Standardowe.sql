
--aggregation
--aggregation from values

SELECT StudentId,
 AVG(Grade) AS AvgGrade,
 AVG(DISTINCT Grade) AS AvgDistinctGrade
FROM (VALUES (1, 100),
 (1, 100),
 (1, 100),
 (1, 99),
 (1, 99),
 (1, 98),
 (1, 98),
 (1, 95),
 (1, 95),
 (1, 95)
 ) dt (StudentId, Grade)
GROUP BY StudentID;

--Liczymy cala nalaeznos , liczmy liczbe operacji , minimalna operacja ,max operacja
select * from sales.salesOrderHeader

SELECT TOP (5)
 AccountNumber,
 SUM(TotalDue) AS TotalDueByAccountNumber,
 Count(TotalDue) as TotalDueOpertions,
 Min(TotalDue) as MinTotalDueOperation,
 Max(TotalDue) as MaxTotalDueOperation,
 Avg(TotalDue) as AvgTotalDueOperation,
 STDEV(TotalDue) as StandardowaDewiacjaBSample,
 STDEVP(TotalDue) as StandarowaDewiacjaBData
FROM Sales.SalesOrderHeader
GROUP BY AccountNumber
ORDER BY AccountNumber;

select AccountNumber, TotalDue from sales.SalesOrderHeader where AccountNumber = '10-4020-000002'



--Przyklad wariancji
--Liczymy tu tez swoje odchylenie standardowe

Select * from Sales.SalesOrderHeader;
Select TaxAmt  from Sales.SalesOrderHeader;

SELECT VAR(TaxAmt)  AS Variance_Sample,
 VARP(TaxAmt) AS Variance_EntirePopulation
FROM Sales.SalesOrderHeader;

--Przyklad Dewiacji
Select * from sales.SalesOrderDetail
Select UnitPrice from sales.salesOrderDetail order by UnitPrice
Select  AVG(UnitPrice)  from Sales.SalesOrderDetail;

--liczymy tu liczbe elementow oraz srednia aby pozniej wyliczyc wlasna dewiacje
DECLARE @SredniaCena float , @liczbaCen int
Select @SredniaCena = AVG(UnitPrice) , @liczbaCen = Count(UnitPrice)  from Sales.SalesOrderDetail;
Select @SredniaCena , @liczbaCen


--Dewiacja moja i tu popunitprice maja te sama wartosc !!!!
--Na podstawie odchylenia standardowego na wiki
SELECT STDEV(UnitPrice) AS StandDevUnitPrice,
	   STDEVP(UnitPrice) AS StandDevPopUnitPrice,
	   SQRT(SUM(POWER((UnitPrice - @SredniaCena),2)/@liczbaCen)) as MyDevition
FROM Sales.SalesOrderDetail;