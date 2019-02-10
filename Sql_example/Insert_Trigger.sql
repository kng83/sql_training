
--After trigger this is default trigger
--Trigger jest uruchamiany gdy nastapi juz na tabeli

--Instead of Trigger - jest uruchamiany przed insertem do tablicy

--Commands create trigger , drop trigger ,disable trigger and alter table
--When trigger was disable you can make enable trigger

-- Gdy jest trigger to sa specjalne tablice ktore sprawdzaja czy jak cos zmienimy to np 
-- w after trigger sprawdzimy co bylo;


Create table TriggerEx(
	LastName varchar(50),
	FirstName varchar(50),
)

--robimy trigger to bedzie insert trigger
--zwroc uwage na select z inserted to sa dane ktore sa wrzucane
go;
Create Trigger Notify
On TriggerEx
For Insert
AS
Print 'Attention!!!'
Print 'A row was inserted into the TrigEx table...'
Select 'Then inserted data was: ', * from inserted
Select * From TriggerEx;


--Wrzuc cos na ruszt
Insert Into TriggerEx
(LastName,FirstName)
Values ('kot2','bobo2'),('kot3','bobo3')

