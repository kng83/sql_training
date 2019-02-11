

--Proste procedury 
--UseRowCount
--to jest to samo co ponizej tylko z wykorzystaniem zmiennej
DECLARE @AddressLine1 nvarchar(60) = 'Heiderplatz';
SELECT AddressID, AddressLine1
FROM Person.Address
WHERE AddressLine1 LIKE '%' + @AddressLine1 + '%';

--Tu sa wszystkie kolumny
Select top 10  * from Person.Address where AddressLine1 Like '%' + 'Heiderplatz' + '%';


--one line affected tak mozemy otrzymac linie
go;
DECLARE @AddressLine1 nvarchar(60);
SELECT @AddressLine1; --null

go;
DECLARE @AddressLine1 nvarchar(60);
set @AddressLine1 = '10'
SELECT @AddressLine1; --10


-- Otrzymanie wartosci i przekazanie jako zmienna
go;
DECLARE @Adres_1 nvarchar(60);
DECLARE @Adres_2 nvarchar(60);
SELECT @Adres_1 = AddressLine1, @Adres_2 = AddressLine2
FROM Person.Address
WHERE AddressID = 66;
--Otrzymalismy 2 wartosci Adres_1 i Adres_2 i robimy z nich zapytanie
SELECT @Adres_1 AS Address1, @Adres_2 AS Address2;

go;
--Wersja z defaultem i jezeli wartosc nie trafimy w id lub wiecej niz 1 wynik to info
DECLARE @AddressLine1 nvarchar(60) = '101 E. Varnum'
DECLARE @AddressLine2 nvarchar(60) = 'Ambulance Desk'
SELECT @AddressLine1 = AddressLine1, @AddressLine2 = AddressLine2
FROM Person.Address
WHERE AddressID = 66;
IF @@ROWCOUNT = 1
 SELECT @AddressLine1, @AddressLine2
ELSE
 SELECT 'Either no rows or too many rows found.';


