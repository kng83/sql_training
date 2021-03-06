
--Pobranie tablicy telefonu z jednej tablicy , emailu z drugiej i imienia in nazwiska z 3 
-- Pruba zrobienia bez aliasow dotyczacy tablic i dosc to dziala

SELECT PersonPhone.BusinessEntityID,
	 FirstName,
	 LastName,
	 PhoneNumber,
	 EmailAddress
FROM Person.Person
	 INNER JOIN Person.PersonPhone
	 ON Person.BusinessEntityID = PersonPhone.BusinessEntityID
	 Inner Join Person.EmailAddress
	 ON  Person.BusinessEntityID = EmailAddress.BusinessEntityID
ORDER BY
 LastName,
 FirstName,
 Person.BusinessEntityID;


 --to test many to many to chyba wiele tablic do wielu
select * from sales.specialOffer;
select * from Sales.SpecialOfferProduct;
select * from Production.Product;


SELECT p.Name, s.DiscountPct
FROM Sales.SpecialOffer s
	 INNER JOIN Sales.SpecialOfferProduct o
		ON s.SpecialOfferID = o.SpecialOfferID
	 INNER JOIN Production.Product p
      ON o.ProductID = p.ProductID
--WHERE p.Name = 'Purpose Bike Stand';


--Join to years. Uzywamy tutaj tej samej tablicy i raz bierzemy rok 2012 i raz 2011
--i robi joina i ta date dajemy do osobnych kolumn. To moze sie udac z logowanie po _anma
-- jest tu takze grupowanie po id bo jest duzo powtorzen. Ja bym mogl tu grupowac po _name.


SELECT * FROM Sales.SalesPersonQuotaHistory order by QuotaDate;

SELECT s.BusinessEntityID,
 SUM(s2012.SalesQuota) Total_2012_SQ, Count(s2012.SalesQuota) Count_2012,
 SUM(s2011.SalesQuota) Total_2011_SQ, Count(s2011.SalesQuota) Count_2011
FROM Sales.SalesPerson s
	LEFT OUTER JOIN Sales.SalesPersonQuotaHistory AS s2012
	ON s.BusinessEntityID = s2012.BusinessEntityID
	AND YEAR(s2012.QuotaDate) = 2012
	LEFT OUTER JOIN Sales.SalesPersonQuotaHistory AS s2011
	ON s.BusinessEntityID = s2011.BusinessEntityID
	AND YEAR(s2011.QuotaDate) = 2011
GROUP BY s.BusinessEntityID;

--Suma utargu miedzy rokami 
--Sumujemy due po orderDate i kazdy dzien to jakas suma i pozniej wycinamy dni miedzy 2011 a 2012
 SELECT OrderDate,
 SUM(TotalDue) AS TotalDueByOrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-07-01T00:00:00'
 AND OrderDate < '2012-08-01T00:00:00'
GROUP BY OrderDate;


--wynik zepsutych czesci i przycznya scrapped to zlomowane (scrapped reason - powod zlomowania)
select * from Production.ScrapReason;
select * from Production.WorkOrder order by ProductId
select * from Production.Product;

SELECT s.Name,
 COUNT(w.WorkOrderID) AS Cnt
FROM Production.ScrapReason s
 INNER JOIN Production.WorkOrder w
 ON s.ScrapReasonID = w.ScrapReasonID
GROUP BY s.Name
HAVING COUNT(*) > 50;

-- creating summary cubes
-- No explain of rollup because it will be removed in the future releases
select * from Production.ProductInventory;

SELECT i.Shelf,
 i.LocationID,
 SUM(i.Quantity) AS Total
FROM Production.ProductInventory as i
 GROUP BY CUBE(i.Shelf, i.LocationID);

 --Dzieki temu zawansowanemu query podzial na pólki i na lokacje wszystko jest sumowane na odrbnosc
 With CTE as (
SELECT i.Shelf, i.LocationID, p.Name, SUM(i.Quantity) AS Total
FROM Production.ProductInventory as i
INNER JOIN Production.Product p
 ON i.ProductID = p.ProductID
 GROUP BY CUBE(i.Shelf, i.LocationID,p.Name)
 )
 Select * from CTE where (Shelf is Not Null) and (LocationID is Not Null) AND ( Name is NOt Null)
 Order by shelf ,locationId ,total


