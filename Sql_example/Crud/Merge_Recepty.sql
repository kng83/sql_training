

-- Robimy merga 

--Najpierw tablica
--tutaj deklaruje schemat nowy
go;
Create schema Robert
go;

CREATE TABLE Robert.LastCustomerOrder
 (
 CustomerID INT,
 SalesorderID INT,
 CONSTRAINT pk_LastCustomerOrder PRIMARY KEY CLUSTERED (CustomerId)
 ) ;
 @CustomerID INT = 105,
 @SalesOrderID INT = 103 ;

MERGE INTO Robert.LastCustomerOrder AS tgt
 USING (
	SELECT 
	CustomerID = @CustomerID,
	SalesOrderID = @SalesOrderID
	) AS src
 ON tgt.CustomerID = src.CustomerID
 WHEN MATCHED --tu mozna jeszcze warunki dopisac
	THEN UPDATE
	SET tgt.SalesOrderID = src.SalesOrderID
 WHEN NOT MATCHED
	THEN INSERT (CustomerID,SalesOrderID)
	VALUES (src.CustomerID, src.SalesOrderID) 