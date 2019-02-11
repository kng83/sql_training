
-- A store procedure with input 
--Robimy modyfikacje z alter

Alter PROC GetPhone
@lastname varchar(40)='Abel' --dajemy wartosc domyslna 
 AS 
Select p.FirstName + ' ' +  p.LastName as 'FullName', pp.PhoneNumber
from Person.Person as p
Join Person.PersonPhone as pp
ON p.BusinessEntityID = pp.BusinessEntityID

Where LastName Like  @lastname;

--Tak wywolujemy procedure z parametrami dajemy like aby bylo fajniej

GetPhone 'Jo%'

