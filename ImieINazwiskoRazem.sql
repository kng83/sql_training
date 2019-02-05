-- To jest przyklad jak mozemy polaczyc np imie i nazwisko


use AdventureWorks2012;
select FirstName + ' ' + LastName from Person.Person;

--Sortowane po ostatnim imieniu
use AdventureWorks2012;
select FirstName + ' van ' + LastName from Person.Person 
order by LastName DESC, FirstName;