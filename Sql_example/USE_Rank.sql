--using rank
select BusinessEntityID , Rate  
from HumanResources.EmployeePayHistory 
order by rate desc;

--wprowadzamy rank
--Dzieki temu mozemy usunac order i powstaje nam ranking rosnocy od rate
-- Jezeli 2 wartosci sa takie same to maja wartosc taka sama w rankingu;
select BusinessEntityID , Rate  ,
Rank() OVER (ORDER by Rate DESC) as RankByRate
from HumanResources.EmployeePayHistory;