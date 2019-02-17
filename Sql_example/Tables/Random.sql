
--tu bierzemy random
SELECT BusinessEntityID,FirstName,
 LastName 
FROM Person.Person TABLESAMPLE SYSTEM (2 PERCENT);


