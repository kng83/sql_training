-- using goto
GOTO Pawel;
Select top 2 * from Person.Person;
Pawel:Select top 1 * from Person.Person;

--Opoznienie 3 sekundy
WAITFOR DELAY '00:00:03';
BEGIN
 SELECT FirstName, LastName
 FROM Person.Person
END;