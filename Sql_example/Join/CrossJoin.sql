--Cross join nadaje sie swietnie do robienia dummy data

--Cross join
select distinct top 5 firstName, lastName from Person.Person
select distinct top 5 PhoneNumber from Person.PersonPhone;

--Robimy nowe tablice
select distinct top 5 firstName, lastName INTO PersonCross from Person.Person
select distinct top 5 PhoneNumber INTO PhoneCross from Person.PersonPhone;

--Patrzymy
select * from PersonCross
select * from PhoneCross;

--Teraz robimy cross Join naszych dwoch tablic to sie nazywa kartezjanski
--Cross join robi nam wszystkie mozliwe kombinacje czyli z 2 tabel po 5 dostajemy 25
select p.FirstName , p.LastName ,ph.PhoneNumber
from
personcross as p
CROSS JOIN
PhoneCross as ph
Order by p.LastName;