
--While statement and procedure 
-- To jest fajne bo oblicza zajetosc poszczegolny tablic
-- to jest ciekawa tablica INFORMATION_SCHEMA.tables

DECLARE @AWTables TABLE (SchemaTable varchar(100));
DECLARE @TableName varchar(100);
-- Insert table names into the table variable
INSERT @AWTables (SchemaTable)
	SELECT TABLE_SCHEMA + '.' + TABLE_NAME
	FROM INFORMATION_SCHEMA.tables
	WHERE TABLE_TYPE = 'BASE TABLE'
	ORDER BY TABLE_SCHEMA + '.' + TABLE_NAME;
-- Report on each table using sp_spaceused
WHILE (SELECT COUNT(*) FROM @AWTables) > 0
BEGIN
 SELECT TOP 1 @TableName = SchemaTable
 FROM @AWTables
 ORDER BY SchemaTable;
 EXEC sp_spaceused @TableName;
 DELETE @AWTables
 WHERE SchemaTable = @TableName;
END;

--sprawdzam informacje o tablicy
Select top 3 * from INFORMATION_SCHEMA.tables;
Select  *   from [Person].Person exec sp_spaceused;

--test while dopiero widzimy gdy przekroczymy liczbe 7;
DECLARE @n int = 1;
WHILE @n < 10
BEGIN
	SET @n = @n + 1;
	IF @n > 1 and @n < 7
	CONTINUE;
	PRINT 'Nie widac od 1-6.' + Cast(@n as varchar(10)) + ' Inaczej ' + Convert(varchar(10), @n);
END;

--Jezli liczba wynikow wieksza od 100 to zakoncz
go;

--dziwne to jest ze jest spoznione o jedno pytanie
SELECT top 91 FirstName ,LastName ,
 CASE @@ROWCOUNT when 9 then 99 Else @@ROWCOUNT
 End AS Answer
From Person.Person;


