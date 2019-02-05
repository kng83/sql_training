
--Test grouping 
select * from Sales.SalesTerritory;

select SalesYTD , CountryRegionCode from Sales.Salesterritory;

--poniewaz mamy wiele us prubujemy je zawezic
select SalesYTD , CountryRegionCode 
from Sales.Salesterritory
where SalesYTD > 4000000;

select SalesYTD , CountryRegionCode from Sales.Salesterritory;

--robimy agregacje wartosci w celu zmniejszenia US


--grupujemy po CountryRegionCode a wartosc pieniedzy jest dodawana do siebie gdy mamy ten sam region
select SUM(SalesYTD) , CountryRegionCode 
from Sales.Salesterritory
where SalesYTD > 4000000
Group By CountryRegionCode;


--Przyklad agregacji po kontynentach
select SalesLastYear , [Group]  from Sales.SalesTerritory;
--grupujemy sprzedaz w ostatnim roku po kontynentach
select  SUM(SalesLastYear) as 'Last year total' , [Group] 
 from Sales.Salesterritory
 Group By [Group]