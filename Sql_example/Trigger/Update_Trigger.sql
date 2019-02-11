
--Ten trigger zostanie uruchomiony gdy zostanie uruchomiony na naszej starej tabliy
--TriggerEx

Create Trigger ModEx
On TriggerEx
For Update
As
Print 'Attention!'
Print 'Row was modified in the TriggerEx table...'

Select 'Deleted: The orginal data was: ',  * from deleted 
Select 'Inserted: The new data is: ', * from inserted
Select * From TriggerEx;


--mozemy teraz testowac
go;
Update TriggerEx
Set LastName='Myjka'
Where LastName = 'kot2';









--Stara dla info
--Create table TriggerEx(
--	LastName varchar(50),
--	FirstName varchar(50),
--)

----robimy trigger to bedzie insert trigger
----zwroc uwage na select z inserted to sa dane ktore sa wrzucane
--go;
--Create Trigger Notify
--On TriggerEx
--For Insert
--AS
--Print 'Attention!!!'
--Print 'A row was inserted into the TrigEx table...'
--Select 'Then inserted data was: ', * from inserted
--Select * From TriggerEx;


----Wrzuc cos na ruszt
--Insert Into TriggerEx
--(LastName,FirstName)
--Values ('kot2','bobo2'),('kot3','bobo3')

