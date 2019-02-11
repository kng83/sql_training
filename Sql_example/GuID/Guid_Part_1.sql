--Create Guid global unique id;
--global unique identifier
--Create uniqueidentifier

Create Table UsingGuids(
	ID uniqueidentifier,
	LastName varchar(40),
	FirstName varchar(40))

--robimy wsad wartosci
Insert Into dbo.UsingGuids
Values
(NewID(),'Krowa','Gosia'),(NewID(),'Pies','Rafa³');

--zobaczmy 
Select * from dbo.UsingGuids;