
-- A simple store procedure
-- to jest zrobienie prostej procedury
-- to wykonujemy i mamy zapisana juz procedure

CREATE PROC GetPhone as 
Select p.FirstName + ' ' +  p.LastName as 'FullName', pp.PhoneNumber
from Person.Person as p
Join Person.PersonPhone as pp
ON p.BusinessEntityID = pp.BusinessEntityID
Where LastName = 'Abel';

--droping
Drop Proc GetPhone;

--executing
GetPhone;