--Derived tables


Select * from 
	(Select FirstName , LastName from Person.Person) as DTable
	Where LastName Like 'I%';

--Teraz zmieniamy i dzielimy wyszukiwania
--Tu widzimy problem z wydajnosci bo nasz select wewnetrzny bierze wszystkie kolumny pobiera
Select FirstName , LastName from 
	(Select * from Person.Person where LastName Like 'I%' ) as INames
	Where LastName Like 'In%';


--Mozemy takze zrobic takiego zawansowanego joina
Select p.BusinessEntityID, p.FirstName + ' ' + p.LastName as FullName ,soh.TotalDue, soh.Freight
From Person.Person as p
Join
	--Here goes derived table
	(Select SalesPersonID , Freight , TotalDue from Sales.SalesOrderHeader ) as soh
ON
	p.BusinessEntityID = soh.SalesPersonID
ORDER By
	soh.TotalDue DESC;