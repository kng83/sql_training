
--Select into jest istotne by zrobic tabele z tabeli i nie operowac na waznych tabelach

select * from Sales.SalesTerritory;

-- Tu chcemy to zrobic z tego nowa tablice
select Name, CountryRegionCode ,[Group] ,SalesYTD 
from Sales.SalesTerritory;

select Name, CountryRegionCode ,[Group] ,SalesYTD 
into TestTable
from Sales.SalesTerritory;

select * from TestTable;
