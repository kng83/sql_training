
--Rank going 
--Dense_Rank jest inny od ranku bo nawet gdy wartosc jest rowna to ranking jest inkrementowany

Select TOP(10) 
BusinessEntityID, Rate, DENSE_RANK() over (ORDER by Rate DESC) as RankByRate
  from HumanResources.EmployeePayHistory;


--Ntile dzieli nam w naszym przypadku na 4 grupy
--Jezeli zawezimy to topem to bedziemy mieli mniej czesci
-- N tile  to chyba n czesci tu bedzie po 79 b0 316/4 = 79;
Select 
BusinessEntityID, Rate, NTILE(4) over (ORDER by Rate DESC) as Quartile
  from HumanResources.EmployeePayHistory;


--Select row numbers
--Wyswietla nam tu numery wierszy czasmi to potrzebujemy  Round daje nam do 2 miejs po przecinku
Select ROW_NUMBER() over(order By SalesYTD DESC) as ROW ,
		FirstName,LastName,ROUND(SalesYTD,1,1) as "Sales YTD"
		From Sales.vSalesPerson
		Where TerritoryName IS NOT NULL AND SalesYtd<>0;

--4 razem
Select Top(1) * from Sales.vSalesPerson

-- PUt everything together
Select ROW_NUMBER() over(order By SalesYTD DESC) as ROW ,
	   NTILE(4) over (ORDER by SalesYTD  DESC) as QuartileSalesYTD ,
	   DENSE_RANK() over (ORDER by SalesYTD  DESC) as DenseRankSalesYTD ,
	   RANK() over (ORDER by SalesYTD  DESC) as RankSalesYTD ,
		FirstName,LastName,ROUND(SalesYTD,1,1) as "Sales YTD"
		From Sales.vSalesPerson
		Where TerritoryName IS NOT NULL AND SalesYtd<>0;
