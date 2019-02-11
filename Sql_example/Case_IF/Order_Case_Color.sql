
--Lista czesci czerwone jako pierwsze
SELECT p.ProductID,
 p.Name,
 p.Color
FROM Production.Product AS p
WHERE p.Color IS NOT NULL
ORDER BY CASE p.Color
	WHEN 'Red' THEN NULL
	ELSE p.Color
	End;

--To robi to samo co wyzej ale obojetne jestwielkosc liter
SELECT p.ProductID,
 p.Name,
 p.Color
FROM Production.Product AS p
WHERE p.Color IS NOT NULL
ORDER BY CASE LOWER(p.Color)
 WHEN 'red' THEN ' '
 ELSE LOWER(p.Color)
 End;