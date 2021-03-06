

--Agregacja suma example
--select  * from Sales.SalesOrderDetail;

--using distinct
select  DISTINCT SpecialOfferID  
from Sales.SalesOrderDetail 
order by SpecialOfferID;

--using aggregation suma dla specialnej oferty 4;
select  SUM(LineTotal) as 'Total line sum'
 from Sales.SalesOrderDetail
 where SpecialOfferID = 4;