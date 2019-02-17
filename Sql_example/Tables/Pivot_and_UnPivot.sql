--pivot zabiera wiersze do kolumn
--unpivot zabiera kolumny do wierszy


select * from HumanResources.Department;
select * from HumanResources.EmployeeDepartmentHistory;
select * from HumanResources.Shift;

--Pivot - konwertuje wiersze na kolumny
-- Dosc trudny przyklad ze zmianami
-- Sprawdzamy ile ludzi z danego dzialu jest na zmianie dziennej, nocnej i popoludniowej
SELECT ShiftName,Production,Engineering,Marketing
FROM (
	 SELECT s.Name AS ShiftName,h.BusinessEntityID,d.Name AS DepartmentName
	 FROM HumanResources.EmployeeDepartmentHistory h
     INNER JOIN HumanResources.Department d
     ON h.DepartmentID = d.DepartmentID
     INNER JOIN HumanResources.Shift s
     ON h.ShiftID = s.ShiftID
 WHERE EndDate IS NULL
 AND d.Name IN ('Production', 'Engineering', 'Marketing')
 ) AS a
PIVOT
(
 COUNT(BusinessEntityID)
 FOR DepartmentName IN ([Production], [Engineering], [Marketing])
) AS b
ORDER BY ShiftName;


--Unpivot
drop Table dbo.Contact;
go;
CREATE TABLE dbo.Contact
 (
 EmployeeID INT NOT NULL,
 PhoneNumber1 BIGINT,
 PhoneNumber2 BIGINT,
 PhoneNumber3 BIGINT
 )
GO
INSERT dbo.Contact
 (EmployeeID, PhoneNumber1, PhoneNumber2, PhoneNumber3)
VALUES (1, 2718353881, 3385531980, 5324571342),
 (2, 6007163571, 6875099415, 7756620787),
 (3, 9439250939, NULL, NULL);

-- robimy tabele ktora ma 3 komorki z podobnymi wartosciami 
select * from dbo.Contact;

--unpivot bierze kolumny z telefonami i wrzuca je do nowej kolumny o
-- nazwie phoneValue
SELECT EmployeeID,
 PhoneType,
 PhoneValue
FROM dbo.Contact c
UNPIVOT
(
 PhoneValue
 FOR PhoneType IN ([PhoneNumber1], [PhoneNumber2], [PhoneNumber3])
) AS p;