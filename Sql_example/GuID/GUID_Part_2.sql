--Create Guid global unique id;
--Part 2 

Create Table DefaultGuid(
	ID uniqueidentifier Default NewId(),
	LastName varchar(40),
	FirstName varchar(40)
	)

--Teraz bedziemy wkladac do tablicy ale bez podania NEWID()
Insert into DefaultGuid(LastName,FirstName)
		Values
		('Bobik','Pies'),('Ryba','Jan')

--teraz to sprawdzimy
select * from dbo.DefaultGuid;

