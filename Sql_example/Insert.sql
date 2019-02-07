
--Insert statement

select * from Production.UnitMeasure;

--Insert 
--Format daty piszemy w ciagu
Insert Into Production.UnitMeasure
(UnitMeasureCode, Name, ModifiedDate)
VALUES
('HsS','Hannas','20080415 22:22:22'); --taka data z godzina jest mozna tez 20080414


--Teraz kilka wsadow naraz do bazy
--2 wiersze
Insert Into Production.UnitMeasure
(UnitMeasureCode, Name, ModifiedDate)
VALUES
('HS1','H1','20140808'), ('HS2','H2','20140808');

--Insert select statement
--Robimy dla przykladu tablice
Create table dbo.EmployeeSales
(
	DataSource varchar(20) Not NUll,
	BusinessEntityID varchar(11) Not Null,
	LastName varchar(40) Not Null,
	SalesDollars money Not Null
);

--Teraz insert and select
--Do nowej utworzonej tablicy dajemy wartosci z innej tablicy
Insert into dbo.EmployeeSales
SELECT 'SELECT', sp.BusinessEntityID, c.LastName, sp.SalesYTD
From Sales.SalesPerson As sp
Inner Join Person.Person as c
On sp.BusinessEntityID = c.BusinessEntityID
Where sp.BusinessEntityID Like '2%'
Order by sp.BusinessEntityID, c.LastName;

select * from dbo.EmployeeSales;


--insert store procedure
--jeszcze nie bylo procedur
--usuwamy wartosci z tablicy
delete from EmployeeSales;

--wywolanie procedury
--i robi to co wyzej bo procedura jest taka sama jak kod
Insert Into EmployeeSales
Exec dbo.uspGetEmployeeSales;



--Robienie procedury musimy ja zakomentowac bo bedzie zawsze blad 
--Create Procedure dbo.uspGetEmployeeSales
--as
--SET NOCOUNT ON --?
--SELECT 'Procedure', sp.BusinessEntityID, c.LastName, sp.SalesYTD
--From Sales.SalesPerson As sp
--Inner Join Person.Person as c
--On sp.BusinessEntityID = c.BusinessEntityID
--Where sp.BusinessEntityID Like '2%'
--Order by sp.BusinessEntityID, c.LastName;