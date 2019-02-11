
--Liczymy srednia

select * from Sales.SalesOrderDetail;

select AVG(LineTotal) as 'Line Total AVG' from Sales.SalesOrderDetail;

--avrage for special offer
select AVG(LineTotal) as 'Line Total Avg against id'
	from Sales.SalesOrderDetail
	where (SpecialOfferID = 4);