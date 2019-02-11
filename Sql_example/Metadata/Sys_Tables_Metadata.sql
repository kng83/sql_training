
--sys Tables list of sys tables
--mamy tutaj metadane naszych wszysstkich tabel
select * from sys.tables;

--teraz mamy opis wszystkich kolumn w systemie
select * from sys.all_columns;

--tu mamy infromacje o person.person
select * from sys.all_columns
where object_Id = (Select [Object_Id] from sys.tables where name = 'Person')