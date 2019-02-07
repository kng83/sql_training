
select top 1 * from Sales.Customer
select top 1 * from Sales.SalesOrderHeader

--Left outer join dzieki temu mozemy zobaczyc ktorzy klienci np u nas nie zamowili a
--sa klientami
Select 
c.CustomerID,
c.CustomerID as Expr1,
soh.OrderDate
From
Sales.Customer as c Left outer Join
Sales.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
Order by soh.OrderDate DESC; --32166


--Right outer join
Select 
c.CustomerID,
c.CustomerID as Expr1,
soh.OrderDate
From
Sales.Customer as c Right outer Join
Sales.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
Order by soh.OrderDate DESC; --31465


--Full Join
Select 
c.CustomerID,
c.CustomerID as Expr1,
soh.OrderDate
From
Sales.Customer as c Full Outer Join
Sales.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
Order by soh.OrderDate DESC; --32166

select count(*)  from Sales.SalesOrderHeader ; --31465
select count(*)  from Sales.Customer ; --19820

--cross join
Select 
c.CustomerID,
c.CustomerID as Expr1,
soh.OrderDate
From
Sales.Customer as c inner Join
Sales.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
Order by soh.OrderDate DESC; --32166