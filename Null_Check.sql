
--Null example

use AdventureWorks2012;
select Title, FirstName, LastName from Person.Person;


-- to sa nie null
use AdventureWorks2012;
select Title, FirstName, LastName from Person.Person
where Title IS NOT NULL
order by LastName, FirstName;


-- to sa nulle
use AdventureWorks2012;
select Title, FirstName, LastName from Person.Person
where Title IS NULL
order by LastName DESC, FirstName;