
--Przeglad funkcji analitycznych do rankingu
--UNBOUNDED PRECEDING, all rows before the current row -> fixed
--UNBOUNDED FOLLOWING, all rows after the current row -> fixed

Select * from sales.SalesOrderHeader;

Select AccountNumber, SalesOrderID from Sales.SalesOrderHeader order by SalesOrderId;


--FIRST_VALUE and LastValue
--glupie i niepotrzebne bo wrzucamy do calej kolumny wartosc pierwsza co znajdziemy w salesOrderId
--pytanie czy mozna znalezc id pierwszgo wystapienia np nr jakiego elementu
SELECT 
AccountNumber,
FirstAccount = FIRST_VALUE(AccountNumber) OVER (Order by  SalesOrderID),
LastAccount  = LAST_VALUE(AccountNumber) OVER ( Order by SalesOrderId),
DueDate,
TotalDue
FROM Sales.SalesOrderHeader AS t
ORDER BY AccountNumber, DueDate;

--LAG
--Lag przesuwa nam wszystko o 1 w kolumnach cos jak przesuniety join
--mozemy wybrac ilosc wierszy przesuniecia i wartosc offsetu na poczatku
Select TotalDue, 
	   LagCell = Lag(TotalDue,1,null) over (order by OrderDate) 
from Sales.SalesOrderHeader;

--Lead
--Jest to odwrotnosc lag przesuwa druga kolumne w gore
Select TotalDue, 
	   LagCell = Lead(TotalDue,1,null) over (order by OrderDate) 
from Sales.SalesOrderHeader;


--CUME_DIST
--skumulowana wartosc w grupie wartosci
Select TotalDue, 
	   AccountNumber,
	   LagCell = Cume_Dist() over (order by SalesOrderId) 
from Sales.SalesOrderHeader
Order by AccountNumber

--Szukamy najtanszego w grupie
--Ciekawy wynik jest dla MostExpensiv  bo bedzie pamietalo jaki by najwyzszy i uzupelni o niego
--mozliwe ze tym mozna w jakis sposob daty uzupelnic
SELECT Name, 
	   ListPrice,   
       LeastExpensive  = FIRST_VALUE(Name) OVER (ORDER BY ListPrice ASC),
	   LeastExpensive  = FIRST_VALUE(Name) OVER (ORDER BY ListPrice DESC),
	   MostExpensiveAsc = Last_Value(Name) over (order by ListPrice Asc),
	   MostExpensiveDesc = Last_Value(Name) over (order by ListPrice DESC)
FROM Production.Product  
WHERE ProductSubcategoryID = 37; 


--Przyklad z ksiazki zmieszany z moimi First and last value
--Gdzie klient dal swoje najdrozsze i najmniejsze zlecenie
-- Np tutaj robimy partycjonowanie i dajemy tez liczbe naszych orderow
-- dodajmy jeszcze najwieksze i najmniejsze zlecenie

--Sprawdzam 2 klienta czy to dziala
Select * from Sales.SalesOrderHeader where CustomerID = '11001'

SELECT DISTINCT 
	CustomerID,
	NumberOfOrders = Count (OrderDate) Over (Partition by CustomerID), 
	LowDue = Min (TotalDue) over (Partition by CustomerId),
	MaxDue = Max (TotalDue) over (Partition by CustomerId ),
	OrderDateLow=FIRST_VALUE(OrderDate)
			OVER (
				PARTITION BY CustomerID 
				ORDER BY TotalDue 
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) ,
	OrderDateHigh= LAST_VALUE(OrderDate)
			OVER (
				PARTITION BY CustomerID
				ORDER BY TotalDue
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
	FROM Sales.SalesOrderHeader
	Order by customerId;


--Zapasowe
--RunTotalDue = SUM(TotalDue) OVER (PARTITION BY AccountNumber ORDER BY DueDate)
--SumByRange = SUM(Salary) OVER (ORDER BY Salary RANGE UNBOUNDED PRECEDING)

