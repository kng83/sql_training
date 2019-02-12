
Select * from Production.ProductInventory;


--grupowanie po polce i lokalizaji uzywajaca cube
SELECT i.Shelf,
 i.LocationID,
 SUM(i.Quantity) AS Total
FROM Production.ProductInventory i
GROUP BY CUBE(i.Shelf, i.LocationID);


--Rollup podobny do grup
SELECT i.Shelf,p.Name, SUM(i.Quantity) AS Total
	FROM Production.ProductInventory i
	INNER JOIN Production.Product p
	ON i.ProductID = p.ProductID
	GROUP BY ROLLUP(i.Shelf, p.Name);

-- Grouping sets mozna powaznie wszystko grupowac 
SELECT i.Shelf, i.LocationID, p.Name,
	SUM(i.Quantity) AS Total
	FROM Production.ProductInventory i
INNER JOIN Production.Product p
	ON i.ProductID = p.ProductID
	WHERE Shelf IN ('A', 'C')
	AND Name IN ('Chain', 'Decal', 'Head Tube')
	GROUP BY GROUPING SETS(
	(i.Shelf),(i.Shelf, p.Name),(i.LocationID, p.Name)
	);