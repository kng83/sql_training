
With CTE as(
	SELECT SalesPersonID, YEAR(orderdate) AS orderyear, COUNT(*) AS numorders
	FROM Sales.SalesOrderHeader
	WHERE CustomerId = '29614'
	GROUP BY SalesPersonID, YEAR(orderdate)
	HAVING COUNT(*) >= 1
	),
mySome as(
	Select FirstName ,LastName , BusinessEntityID from Person.Person
	)
	
select * from CTE
Join
mySome
On SalesPersonID= BusinessEntityID;