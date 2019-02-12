
Select * from Production.Product;
Select * from Production.BillOfMaterials;

-- wyciecie niektorych id przy uzyciu EXCEPT
With TakeSome as (
	SELECT P.ProductID
	FROM Production.Product as P
	EXCEPT
	SELECT BOM.ComponentID
	FROM Production.BillOfMaterials as BOM
) 
, Rest as (
	Select * from Production.Product)
  
  Select * from TakeSome JOIN Rest 
  ON  TakeSome.ProductID = Rest.ProductID;



  ---Group by

Select * from HumanResources.EmployeePayHistory;

SELECT [RateChangeDate],
 COUNT([Rate]) AS [Count],
 COUNT(DISTINCT Rate) AS [DistinctCount]
FROM [HumanResources].[EmployeePayHistory]
WHERE RateChangeDate >= '2003-01-01T00:00:00.000'
 AND RateChangeDate < '2003-01-10T00:00:00.000'
GROUP BY RateChangeDate;