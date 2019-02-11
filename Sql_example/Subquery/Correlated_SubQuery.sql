--Correlated subquery example
select top(1) * from Person.Person;
select top(1) * from Sales.SalesOrderHeader;

--To jest tradycyjne podejscie z joinem  i szukamy id  i nazwiska ludzi co TotalDue wiekszy niz 150000
select p.BusinessEntityID, p.FirstName + ' ' +p.LastName as name
from Person.Person as p
Join
Sales.SalesOrderHeader as s
ON p.BusinessEntityID = s.SalesPersonID
Where TotalDue >150000;

--Teraz robimy to z subquery
--Bedziemy tu uzywac exists i jesli exist to zwraca ono true
--Niby te dolne zapytanie uruchomi sie jako pierwsze i gdy zwroci prawde to ruszy te gorne
--i potem znowu dolne  az trafi i znowu gorne;
select p.BusinessEntityID, p.FirstName + ' ' +p.LastName as name
From Person.Person as p
Where Exists(Select s.SalesPersonID from Sales.SalesOrderHeader as s 
				Where s.TotalDue > 150000 AND s.SalesPersonID = p.BusinessEntityID);