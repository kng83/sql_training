--Multi valued subquery


select top(1) * from HumanResources.Employee;
select top(1) * from Person.Person;

--szukamy title
Select p.BusinessEntityID, p.Title ,p.FirstName, p.LastName ,e.Gender
From Person.Person as p
Join 
HumanResources.Employee as e
ON
p.BusinessEntityID = e.BusinessEntityID
Where Title = 'Mr.'

--Robimy ta wersje z subquery tam u gory chcielismy tylko businessEntity reszta jest tak o
--Najwazniejsze jest tu in bo one sprawia ze wiecej jest wyszukiwane

Select e.BusinessEntityID from HumanResources.Employee as e
Where e.BusinessEntityID IN (Select p.BusinessEntityID from Person.Person as p where Title='Mr.')