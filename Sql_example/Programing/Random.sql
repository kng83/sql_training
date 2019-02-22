
--Random new id jest dobry bo brak powtorzen
--Chosse pozwala nam wybrac jakas wartosc z jakis

declare @FirstName  varChar(10) = choose(ROUND( rand() * 3,0),'Bill','Steve','Jack')
Select @FirstName 

declare @Some int = ROUND( 3 *RAND(convert(varbinary, newid())), 0);
Select @Some;