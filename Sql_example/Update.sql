

--Update zaczynamy
--Zawsze daj where bo updetujesz wartosci w calej kolumnie od gory do dolu !!!

select Top 10 * from Person.Address;

Update Person.Address
Set AddressLine1 = 'krotka 4'
Where AddressLine1 = '1970 Napa Ct.'


--Next
select * from sales.SalesPerson
Order by TerritoryID;

Update Sales.SalesPerson
Set Bonus=6000, CommissionPct=.10 , SalesQuota = Null
Where TerritoryID = 1;

