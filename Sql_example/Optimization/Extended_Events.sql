
-- SQL Server Extended Events Example 
-- Bedziemy lapac jakies eventy z servera;
-- w menagment jest extended events
--dajemy nowa sesje z wizardem


--Tak wyglada skrypt z wizardu
CREATE EVENT SESSION [ML] ON SERVER 
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.database_name)
    WHERE ([sqlserver].[database_name]=N'AdventureWorks2012')) 
ADD TARGET package0.ring_buffer
WITH (STARTUP_STATE=OFF)
GO

--Test query
--Mozemy w ml dac watch life data
Select p.LastName , p.FirstName , pp.PhoneNumber
from Person.Person as p
Join
Person.PersonPhone as pp
on p.BusinessEntityID = pp.BusinessEntityID;
