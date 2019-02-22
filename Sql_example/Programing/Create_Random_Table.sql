
IF OBJECT_ID('dbo.Numbers', 'U') IS NOT NULL
    DROP TABLE dbo.Numbers
GO

CREATE TABLE Numbers (
Id int NOT NULL PRIMARY KEY,
ActualDate DateTime,
_Name VarChar(25)

)
GO

--Robimy piewsza liczbe do wstawienia
DECLARE @i INT = 1 ; 
DECLARE @RandValue Int = ROUND( 3 *RAND(convert(varbinary, newid())),0);

INSERT INTO dbo.Numbers (Id,_Name,ActualDate) 
VALUES (1,choose(@RandValue,'Bill','Steve','Jack'),GetDate());

--Robimy petle ktora gdy jest wywolywana powtorni bierze 2 razy wiecej elementow niz poprzednio
WHILE @i < 1048576
BEGIN;
    INSERT INTO dbo.Numbers (Id,_Name,ActualDate) 
		SELECT Id + @i ,
		choose(ROUND( 3 *RAND(convert(varbinary, newid())), 0),'Bill','Steve','Jack'),
		DATEADD(MILLISECOND,Id + @i * 100,ActualDate)
    FROM dbo.Numbers; 
    SET @i = @i * 2 ; 
END
GO

SELECT COUNT(*) FROM dbo.Numbers AS RowCownt 
select * from dbo.Numbers;



