
select top 1 * from sales.SalesOrderHeader;

--Przyklad funkcji wbudowancyh
select count(Freight) as 'Count Freight' ,
	   avg(Freight) as 'total Freight'
	    from sales.SalesOrderHeader;

--Tu jest kod naszej funkcji
--Zapisuje sie ona w Functions /scalar
create function TandF(
	@tax money,
	@freight money
)
RETURNS int as
Begin
	Return @tax + @freight
End


--uzywamy funkcji
Select SalesOrderId , dbo.TandF(TaxAmt,Freight) as 'Tax and Freight' ,TaxAmt , Freight from Sales.SalesOrderHeader;
