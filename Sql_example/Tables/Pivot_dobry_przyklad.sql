--Pivot example

--robimy tablice

drop table DailyIncome;
create table DailyIncome(VendorId nvarchar(10), IncomeDay nvarchar(10), IncomeAmount int)

--troche wpisow
insert into DailyIncome values ('SPIKE', 'FRI', 100)
insert into DailyIncome values ('SPIKE', 'MON', 300)
insert into DailyIncome values ('FREDS', 'SUN', 400)
insert into DailyIncome values ('SPIKE', 'WED', 500)
insert into DailyIncome values ('SPIKE', 'TUE', 200)
insert into DailyIncome values ('JOHNS', 'WED', 900)
insert into DailyIncome values ('SPIKE', 'FRI', 100)
insert into DailyIncome values ('JOHNS', 'MON', 300)
insert into DailyIncome values ('SPIKE', 'SUN', 400)
insert into DailyIncome values ('JOHNS', 'FRI', 300)
insert into DailyIncome values ('FREDS', 'TUE', 500)
insert into DailyIncome values ('FREDS', 'TUE', 200)
insert into DailyIncome values ('SPIKE', 'MON', 900)
insert into DailyIncome values ('FREDS', 'FRI', 900)
insert into DailyIncome values ('FREDS', 'MON', 500)
insert into DailyIncome values ('JOHNS', 'SUN', 600)
insert into DailyIncome values ('SPIKE', 'FRI', 300)
insert into DailyIncome values ('SPIKE', 'WED', 500)
insert into DailyIncome values ('SPIKE', 'FRI', 300)
insert into DailyIncome values ('JOHNS', 'THU', 800)
insert into DailyIncome values ('JOHNS', 'SAT', 800)
insert into DailyIncome values ('SPIKE', 'TUE', 100)
insert into DailyIncome values ('SPIKE', 'THU', 300)
insert into DailyIncome values ('FREDS', 'WED', 500)
insert into DailyIncome values ('SPIKE', 'SAT', 100)
insert into DailyIncome values ('FREDS', 'SAT', 500)
insert into DailyIncome values ('FREDS', 'THU', 800)
insert into DailyIncome values ('JOHNS', 'TUE', 600)

--sprawdz
select * from DailyIncome;

--szukamy sredniej dla kazdego sprzedawcy
select * from DailyIncome
pivot (avg (IncomeAmount) for IncomeDay in ([MON],[TUE],[WED],[THU],[FRI],[SAT],[SUN])) as AvgIncomePerDay

--szukamy max dla danego dnia dla Spike
select * from DailyIncome --columns to pivot
pivot (
	  max (IncomeAmount) --pivot on this column
	  for IncomeDay in ([MON],[TUE],[WED],[THU],[FRI],[SAT],[SUN]) --make column for each day
	  )  as	MaxIncomePerDay
where VendorId in ('SPIKE')

--Zrobmy jakiego pivota z adventure works wybieramy jakas malo znaczaca columne i dajemy np max
--Otrzymujemy tyle wierszy ile bylo ale dostajemy kolumny jeszcze

select * from Production.Product;

select ProductId, Name, ProductNumber,ModifiedDate, s.Black , s.Silver , s.Yellow from Production.Product
pivot(
	max(StandardCost) 
	for Color in ([Black],[Silver],[Yellow])
	) as s
--where (s.Black is Not null) or (s.Silver is Not Null) or (s.Yellow is not Null)
Order by Productid