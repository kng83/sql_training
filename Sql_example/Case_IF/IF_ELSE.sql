
--Jezeli wybierzemy wersje inna od 1 to bedzie Black jak 1 to silver
--Begin jest ponoc opcjonalne
DECLARE @QuerySelector int = 3;
IF @QuerySelector = 1
BEGIN
 SELECT TOP 3 ProductID, Name, Color
 FROM Production.Product
 WHERE Color = 'Silver'
 ORDER BY Name
END
 ELSE
BEGIN
 SELECT TOP 3 ProductID, Name, Color
 FROM Production.Product
 WHERE Color = 'Black'
 ORDER BY Name
END;


go;
--to samo co wyzej tylko bez begin
DECLARE @QuerySelector int = 1
IF @QuerySelector = 1
	SELECT TOP 3 ProductID, Name, Color
	FROM Production.Product
	WHERE Color = 'Silver'
	ORDER BY Name
ELSE
	SELECT TOP 3 ProductID, Name, Color
	FROM Production.Product
	WHERE Color = 'Black'
	ORDER BY Name
Go;

--Simple Case
SELECT DepartmentID AS DeptID, Name, GroupName,
 CASE GroupName
 WHEN 'Research and Development' THEN 'Room A'
 WHEN 'Sales and Marketing' THEN 'Room B'
 WHEN 'Manufacturing' THEN 'Room C'
 ELSE 'Room D'
 END AS ConfRoom
FROM HumanResources.Department
