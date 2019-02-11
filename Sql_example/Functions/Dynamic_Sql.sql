
--To jest dynamic sql  i jest troche niebezpieczny
select count (*) from Person.Person;

--Prubujemy zmienna dynamiczan zrobic nasza tablice
--Zwykle przypisanie nie zadziala bo kolejnosc jest inna
Declare @tbl varchar(50) 
Set @tbl = 'Person.Person'
--Select Count (*) From @tbl; --to nie zadziala
EXEC('Select Count(*) From ' + @tbl);


--To jest tak fajne ze zrobimy z tego store procedure
go;
Create Proc CountRows
 @tbl varchar(50) = 'Person.Person'
AS
Exec('Select Count(*) From ' + @tbl);

--uzywamy procedury
go;
CountRows @tbl='Person.Person'; 

--lub tak
go;
exec CountRows 'Person.Person';