

--Table Variables

Declare @mtl Table (
	FirstName VarChar(40),
	LastName VarChar(40),
	Orders Int,
	OrderTotal Int
	)
Insert INTO @mtl 
	(FirstName, LastName, Orders, OrderTotal)
		select p.FirstName ,p.LastName , Count(*) , Sum(soh.TotalDue)
		from Person.Person as p
		Join
		Sales.SalesOrderHeader as soh
		ON p.BusinessEntityID = soh.SalesPersonID
		Group by FirstName , LastName;

select * from @mtl;