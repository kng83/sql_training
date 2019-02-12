
--Mamy tu wartosci Purchase order pomiedzy 1000 a 2000
--Fajana tablica z dublujacymi sie rekordami


WITH cte AS (
SELECT DISTINCT s.CustomerID, s.PurchaseOrderNumber ,s.AccountNumber ,d.UnitPrice 
FROM Sales.SalesOrderHeader as s
	INNER JOIN (
		SELECT SalesOrderID,UnitPrice
		FROM Sales.SalesOrderDetail 
	    WHERE UnitPrice BETWEEN 1000 AND 2000
	) as d
	ON s.SalesOrderID = d.SalesOrderID
) 
Select CustomerID, AccountNumber , Min(CustomerID) as zorro  from cte
 Where PurchaseOrderNumber  IS NOT NULL 
 Group by CustomerID,AccountNumber




