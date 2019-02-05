
--Test Distinc;

select * from sales.SalesTerritory;

select CountryRegionCode from Sales.SalesTerritory;

--uzywamy distinct aby wyodrebnic rozne
select Distinct CountryRegionCode 
from Sales.SalesTerritory
order by CountryRegionCode;

--dodajemy SalesYTD i wtedy mamy 10 kolumn
--i latwo mozemy zrobic agregacje

select Distinct CountryRegionCode ,SalesYTD
from Sales.SalesTerritory
order by CountryRegionCode;

