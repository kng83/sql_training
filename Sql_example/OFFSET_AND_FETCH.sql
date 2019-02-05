

--fetch and offset
select distinct FirstName , LastName from Person.Person 
Order by LastName asc, FirstName asc; -- 19516

-- Bierzemy tylko 10 pierwszych wierszy
select distinct FirstName , LastName from Person.Person 
Order by LastName asc, FirstName asc
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; --ale dziwna konstrukcj ale zwraca 10 pierwszych

-- Bierzemy tylko 10 pierwszych wierszy
select distinct FirstName , LastName from Person.Person 
Order by LastName asc, FirstName asc
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY; --ale dziwna konstrukcj ale zwraca 10 nastepnych
 