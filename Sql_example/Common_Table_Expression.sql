--Common table expression
--this is CTE and is other example of derived table

--Old example of derived table
select * from 
	(select FirstName ,LastName from Person.Person) as DPerson
	Where LastName Like 'I%';


--Robimy CTE tak jak u gory
--Jest tutaj inna skladnie u gory widac ze ta tablica bedzie sie nazywala DPerson

WITH DPerson(FirstName ,LastName)
AS 
	(Select FirstName ,LastName from Person.Person)
--zapytanie do nowej tablicy
Select FirstName ,LastName from DPerson
Where LastName Like 'I%';