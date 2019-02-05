USE AdventureWorks2012;
--Uzywanie aliasow do kolumn
--Aliasy sa tez wyswietlane 

--select firstname , lastname from person.person;

select 
	FirstName as First ,
    LastName as Last 
	from Person.Person;

--to samo ale ukryte as
select 
	FirstName  First ,
    LastName  Last ,
	Title NewTitle
	from Person.Person;