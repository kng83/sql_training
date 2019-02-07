SELECT p.FirstName, p.LastName, ph.PhoneNumber
FROM     Person.Person AS p 
    INNER JOIN
Person.PersonPhone AS ph ON p.BusinessEntityID = ph.BusinessEntityID
WHERE p.FirstName LIKE 'P%a'
ORDER BY p.FirstName DESC, p.LastName