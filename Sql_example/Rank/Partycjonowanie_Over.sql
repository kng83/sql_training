--Windowed functions partycjonowanie

Select * from Sales.SalesOrderHeader

-- Partycjonujemy tu numerami kont 
-- dla kazdego numeru konta sumujemy totalDue wedlug daty
-- Partycjonowanie jest to wlasciwie group by
-- Jezeli by z tym zrobil group by to nie mogl bym uzyc zmiennej totalDue
-- tutaj w sum mamy kolejno wartosci narastajace kwoty tak jak saldo na koncie
-- tu count jest inkrementowany na bierzaca

SELECT 
AccountNumber,
DueDate,
TotalDue,
NumberOfDue = Count(TotalDue) OVER (PARTITION BY AccountNumber ORDER BY DueDate), --numberuje pozycje
RunTotalDue = SUM(TotalDue) OVER (PARTITION BY AccountNumber ORDER BY DueDate) --tu moze tez byc as ale ta wersja lepiej mi pasuje
FROM Sales.SalesOrderHeader AS t
ORDER BY AccountNumber, DueDate;


--Pruba group by powyzszego
--tez dziala ale totalDue musi by agregowane 

SELECT 
AccountNumber,
DueDate,
NumberOfDue = Count(TotalDue) ,
RunTotalDue = SUM(TotalDue)
FROM Sales.SalesOrderHeader AS t
Group by AccountNumber,DueDate
ORDER BY AccountNumber, DueDate;

Select * from Sales.SalesOrderHeader where AccountNumber = '10-4020-000001';

