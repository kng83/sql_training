--Create SeqGuid
--Sequential Guid

Create Table SeqGuid(
	ID uniqueidentifier Default NewSequentialId(),
	LastName varchar(40),
	FirstName varchar(40)
	)

--Teraz bedziemy wkladac do tablicy ale bez podania NEWID()
Insert into SeqGuid(LastName,FirstName)
		Values
		('Bobik','Piesek'),('Dyla','Jan'),('Oferma','Marta')

--teraz to sprawdzimy
select * from dbo.SeqGuid;

