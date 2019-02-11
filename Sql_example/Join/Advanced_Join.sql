SELECT c.CustomerID,
	 SalesPersonPhone = spp.PhoneNumber,
	 CustomerPhone = pp.PhoneNumber,
	 PhoneNumber = COALESCE(pp.PhoneNumber, spp.PhoneNumber, '**NO PHONE**')
FROM Sales.Customer c
	LEFT OUTER JOIN Sales.Store s
 ON c.StoreID = s.BusinessEntityID
	LEFT OUTER JOIN Person.PersonPhone spp
 ON s.SalesPersonID = spp.BusinessEntityID
	 LEFT OUTER JOIN Person.PersonPhone pp
 ON c.CustomerID = pp.BusinessEntityID
ORDER BY CustomerID ;