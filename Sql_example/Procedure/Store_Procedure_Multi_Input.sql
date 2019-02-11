--multi Parameter procedure


Alter PROC GetPhone2
@firstName varchar(40),
@lastName varchar(40)

AS
Select p.FirstName + ' ' +  p.LastName as 'FullName', pp.PhoneNumber
from Person.Person as p
Join Person.PersonPhone as pp
ON p.BusinessEntityID = pp.BusinessEntityID
Where (LastName Like @lastName and FirstName Like @firstName)

--droping
Drop Proc GetPhone2

--executing
GetPhone2 'Kath%' ,'A%';
--inaczej mozemy napisac tak
GetPhone2 @firstName ='Kath%' ,@lastName ='Ad%'; --brak bledu