
select * from sales.SalesOrderHeader

--robimy case i wywalamy case jako tablice
--Dochodzi nam jeszcze jedna kolumna Customer Ranking 
select CustomerID, SalesOrderNumber, TotalDue,
Case 
	When TotalDue < 2500 then 'Low'
	When TotalDue > 2500 and TotalDue < 10000 then 'Avg'
	When TotalDue >10000 then 'High' 
End AS 'Customer Ranking'
from Sales.SalesOrderHeader

--Teraz robimy ile towarow sprzedalismy w jakims miesiacu roku
-- fajnie wyszlo

select Month(OrderDate) as 'Month', 
Sum(Case Year(OrderDate) When 2006 then 1 else 0 END ) as 'Orders',
Sum(Case Year(OrderDate) When 2006 then TotalDue else 0 End) as 'Total Orders'
from Sales.SalesOrderHeader
group by Month(OrderDate)
order by Month(OrderDate) asc 