
--Like and in 

select FirstName , LastName 
from Person.Person
where LastName = 'Walters'

--like ostatnie imie na w (W% to wszystko na w)
select FirstName , LastName 
from Person.Person
where LastName LIKE 'Wa%' --506 rows

--like ostatnie imie na w (_ -to kazda litera)
select FirstName , LastName 
from Person.Person
where LastName LIKE 'W_x%' --waxman

--pierwsze litery a lub r ,w
select FirstName , LastName 
from Person.Person
where LastName LIKE '[adr]%' --3473 rows

--pierwsze litery a do f 
select FirstName , LastName 
from Person.Person
where LastName LIKE '[a-f]%' --4613 rows

--pierwsze litery NIE a do f 
select FirstName , LastName 
from Person.Person
where LastName LIKE '[^a-f]%' --15359 rows

--teraz sprawdzimy IN i np kto ma imie Jon lub John
select FirstName , LastName 
from Person.Person
where FirstName IN ('Jon', 'John'); --106 rows
