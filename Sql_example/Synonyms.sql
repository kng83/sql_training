--Create synonyms


Select * INTO Test100 
from HumanResources.Employee;

--robimy synonima

CREATE SYNONYM MLTable for dbo.Test100;

--testujemy naszego synonima najpierw orginalna tablica
select * from Test100;

--teraz synomym
select * from MLTable;

--teraz zmieniamy nazwe naszej glownej tablicy z test100 na test200

EXEC sp_rename 'Test100' , 'Test200';

select * from MLTable;

--aby to znowu dzialalow trzeba to naprawic

drop SYNONYM MLTable;

--budujemy znowu synonim

CREATE SYNONYM MLTable for dbo.Test200;

select * from MLTable; 
--nie widze dobrego zastosowania dla synonimow
