
--Temporery table 2 rodzaje
--# local z jednym hashem (jest dla jednego uzytkownika jesli sie wyloguje to ona zniknie)
-- ## global z 2 hashami (inni uzytwkonicy tez moga ja uzywac ale jesli nikt i uzytkownik tworzacy sie wyloguje to ginie)
-- tablica dostepna jest w tempdb 

create table #mark (lname varchar(10));

select *from #mark;

--mozemy ja zdropowac

drop table #mark;

create table ##GlobalMark (lsome varchar(10));
