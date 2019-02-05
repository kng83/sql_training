

--sprawdzamy intersect czyli co sie powtarza w dwoch tablica bierzemy tablice
--ktore polaczone sa business id i sprawdzamy powtarzajace sie id ;
-- aby bylo porownanie bierzemy skolerowane tablice  z diagramow;
-- przydatne ale jak powiekszyc zapytanie


select top 1 * from Person.Person;
select top 1 * from HumanResources.Employee;

select BusinessEntityID from Person.Person
INTERSECT
select BusinessEntityID from HumanResources.Employee;

--Tu robimy order aby pokolei bylo

select BusinessEntityID from Person.Person
INTERSECT 
select BusinessEntityID from HumanResources.Employee
Order by BusinessEntityID --tu wyszlo 290 rows

--Teraz robimy except
select BusinessEntityID from Person.Person
EXCEPT
select BusinessEntityID from HumanResources.Employee
Order by BusinessEntityID --reszta czyli 19682;





