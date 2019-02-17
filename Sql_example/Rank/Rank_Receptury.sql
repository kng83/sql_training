--Rankingi sa w ksiazce z recpturami na stronie 130

DECLARE @Test TABLE
 (
 RowID INT IDENTITY,
 FName VARCHAR(20),
 Salary SMALLINT
 );


INSERT INTO @Test (FName, Salary)
VALUES ('George', 800),
 ('Sam', 950),
 ('Diane', 1100),
 ('Nicholas', 1250),
 ('Samuel', 1250),
 ('Patricia', 1300),
 ('Brian', 1500),
 ('Thomas', 1600),
 ('Fran', 2450),
 ('Debbie', 2850),
 ('Mark', 2975),
 ('James', 3000),
 ('Cynthia', 3000),
 ('Christopher', 5000);

 -- unbaounded preceding to bezgranicznie do poprzedzajacego
SELECT RowID, FName, Salary,
 SumByRows = SUM(Salary) OVER (ORDER BY Salary ROWS UNBOUNDED PRECEDING),
 SumByRange = SUM(Salary) OVER (ORDER BY Salary RANGE UNBOUNDED PRECEDING)
FROM @Test
ORDER BY RowID;

--Rank 
--Ranking dotyczacy kwoty sprzedarzy
SELECT BusinessEntityID,
 QuotaDate,
 SalesQuota,
 RANK() OVER (ORDER BY SalesQuota DESC) AS RANK
FROM Sales.SalesPersonQuotaHistory
WHERE SalesQuota BETWEEN 266000.00 AND 319000.00Order by Rank, BusinessEntityID;


