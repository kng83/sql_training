--CROSS APPLY
--Receptury stronna 100

--ta funkcja jest uzywana do tego ze tablica z ktorej pobierane
-- beda dane najpierw zostanie przemielona przez funkcje nasza

CREATE FUNCTION dbo.fn_WorkOrderRouting (@WorkOrderID INT)
RETURNS TABLE
AS
RETURN
 SELECT WorkOrderID,
 ProductID,
 OperationSequence,
 LocationID
 FROM Production.WorkOrderRouting
 WHERE WorkOrderID = @WorkOrderID;
GO;
--cross apply  to wlasnie function ktora dziala na kazdy wiersz
SELECT TOP (5)
 w.WorkOrderID,
 w.OrderQty,
 r.ProductID,
 r.OperationSequence
FROM Production.WorkOrder AS w
 CROSS APPLY dbo.fn_WorkOrderRouting(w.WorkOrderID) AS r
ORDER BY w.WorkOrderID,
 w.OrderQty,
 r.ProductID;


 --Pruba powyzszego z person
 -- robimy funkcje ktora bedzie dolaczana do wyszukiwania i bedzie pobierala inne rzecz
 select * from Person.Person;
 select * from Person.PersonPhone;
 go;
 CREATE function dbo.phoneAdder(@businessEntityID int)
 Returns Table
 AS
	Return 
	Select PhoneNumber from Person.PersonPhone
	Where @businessEntityID = BusinessEntityID; 
 Go;

 --sprawdzamy cross apply czy to dziala

 select p.FirstName, p.LastName , pPhone.PhoneNumber
 from Person.Person as p cross apply dbo.PhoneAdder(p.businessEntityID) as pPhone