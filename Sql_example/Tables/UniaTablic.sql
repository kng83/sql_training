

--Robimy unie 
--najpierw testTable

select FirstName ,LastName 
into Test1
	from Person.Person
	where LastName Like ('Del%');

select FirstName ,LastName 
into Test2
	from Person.Person
	where LastName Like ('Abe%');

--Robimy unie i sa tu usuwane duplikaty
select FirstName , LastName  from Test1
UNION
select FirstName , LastName from Test2;

--Unia tu nie sa usuwane duplikaty
select FirstName , LastName  from Test1
UNION ALL
select FirstName , LastName from Test2;

--dodajemy order i widzimy ze bierze pod uwage 2 tablice
select FirstName , LastName  from Test1
UNION ALL
select FirstName , LastName from Test2
Order by FirstName;