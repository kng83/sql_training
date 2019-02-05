--Having test 

select * from Sales.SalesTerritory;

--group by example
--having laczy nam group  z wherem 
--having to where dla group by !!!

select CountryRegionCode , 
	Sum(SalesYTD)  as Totals
	from Sales.SalesTerritory
	where SalesYtd >4000000
	Group by CountryRegionCode
	Having Sum(SalesYTD)>6000000;
