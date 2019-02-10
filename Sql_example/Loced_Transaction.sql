

Begin transaction MTL 
Update Person.Person
set FirstName = 'Pawel'
Where FirstName ='Terri' and LastName ='Duffy';

--Jesli to wezmiemy teraz jako nowy klient to np (new Card)
--to bedziemy mieli nieskonczone query bo ten update nie jest dokonczony jest locked
-- ale to juz mozna select * from Person.Person where BusinessEntityID = 5;
Select * from Person.Person where LastName = 'Duffy'

--Zeby odblokowac w pelni znowu baze trzeba dac rollback lub commit
-- Lepiej szybko to zrobic bo blokujemy pelne wykorzystanie bazy dla innych uzytkonikow
commit tran MTL

--to do innego pliku
/*
select * from Person.Person where lastName = 'Duffy'

select * from Person.Person where BusinessEntityID = 2;

select * from Person.Person where BusinessEntityID = 5;

select * from Person.Person;
*/
