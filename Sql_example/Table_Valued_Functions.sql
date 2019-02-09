
--Table-valued functions

Create function dbo.PhoneNbrs()
Returns Table
AS Return 
select p.FirstName + ' ' + p.LastName as 'Name',
	   pp.PhoneNumber   from Person.Person as p
Join Person.PersonPhone as pp
ON
p.BusinessEntityID = pp.BusinessEntityID;


-- wywolanie funkcji 
select * from dbo.PhoneNbrs()

-- nawet cos takiego
select Name from PhoneNbrs()
