

--Uzywamy systemowych procedur

exec sys.sp_spaceused;

--mozemy zobaczyc ile zajmuje person
exec sys.sp_spaceused 'Person.Person'

--zaleznosci

exec sys.sp_depends 'Person.Person'