
--W inner Join jezeli w jednej tabeli nie wystepuje nam np id to ten element nie zostanie dolaczony do wyniku
select top (1) * from Person.Person
select top (1) * from Person.PersonPhone;

--wazna jest tu czesc wspolna ktora wyznacza BusinessEntityID;
Select a.FirstName ,a.LastName , b.PhoneNumber
from Person.Person as a 
 INNER JOIN 
 Person.PersonPhone as  b 
ON a.BusinessEntityID = b.BusinessEntityID;