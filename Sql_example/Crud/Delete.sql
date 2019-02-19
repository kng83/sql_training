
--DELETE FROM <table> usunie wszystkie wiersze tablicy !!!
--Jesli chcesz faktycznie usunac wszystkie wiersze uzyj TRUNCATE 
--Jest szybsze i angazuje mniej zasobow
--Delete usuwa wiersz z tablicy

select * from dbo.Mark;
Truncate table  dbo.Mark;

Select Top 25 LastName, FirstName Into DeleteExample
From Person.Person;

--bo teraz nie dziala select top25
--drop table DeleteExample;

select * from DeleteExample;
--usunmy wszystko
delete from DeleteExample;

--usuwamy kim
Delete from DeleteExample
Where LastName = 'Abercrombie' AND FirstName ='Kim';


--usuwamy adams ale najpierw zobmy select
--Select LastName,FirstName
Delete from DeleteExample
Output deleted.*
Where LastName = 'Adams' AND FirstName ='Ben';