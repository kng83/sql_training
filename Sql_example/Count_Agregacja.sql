
--przyklady uzycia count

select LineTotal from Sales.SalesOrderDetail;

select COUNT(LineTotal) from Sales.SalesOrderDetail;

select count(*) from Sales.SalesOrderDetail;

select COUNT(LineTotal) as 'Count 2 offer' from Sales.SalesOrderDetail
where SpecialOfferID = 4;

--tu dodamy jeszcze avrage and sum
select COUNT(LineTotal) as 'Count 4' ,
	   AVG(LineTotal) as'AVG 4',
	   SUM(LineTotal) as 'Sum 4' 
from Sales.SalesOrderDetail
where SpecialOfferID = 4;
