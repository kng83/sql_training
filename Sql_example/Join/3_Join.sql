/****** Script for SelectTopNRows command from SSMS  ******/

Select * from Sales.Store;


With Seller as (
	SELECT SalesPersonID , Count(SalesPersonID) as 'TopSeller' FROM [AdventureWorks2012].[Sales].[Store]
	Group by SalesPersonID
),
SellerPerson as (
	Select FirstName , LastName, BusinessEntityID From Person.Person
)
Select * From Seller Cross Join SellerPerson 
Order by TopSeller DESC,SalesPersonID;

--Oder
Select f.CurrentSalesQuota, p.FirstName,p.LastName ,p.BusinessEntityID from (
	SELECT BusinessEntityID, SalesQuota as CurrentSalesQuota
	FROM Sales.SalesPerson 
	WHERE SalesQuota = (SELECT MAX(SalesQuota)FROM Sales.SalesPerson)
	) as f
INNER JOIN 
Person.Person as p
ON  f.BusinessEntityID = p.BusinessEntityID;