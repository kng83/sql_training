
Select * from HumanResources.Employee

SELECT TOP (111) HireDate
FROM HumanResources.Employee
GROUP BY HireDate
ORDER BY HireDate DESC;

--Szukamy przedzialu gdzie pojawilo pierwsze zatrudnienie i ostatnie
DECLARE @FirstHireDate DATE, @LastHireDate DATE;
SELECT @FirstHireDate = MIN(HireDate),@LastHireDate = MAX(HireDate)
FROM HumanResources.Employee;
SELECT @FirstHireDate ,@LastHireDate;

--Robimy nowa tablice z rezutatu z zapytania

Drop table #Sales
SELECT *
INTO #Sales
FROM Sales.SalesOrderDetail
WHERE ModifiedDate = '2012-07-01T00:00:00';
SELECT COUNT(*) AS QtyOfRows
FROM #Sales;

go;

