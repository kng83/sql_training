
--We make output procedure
--tu robimy output z licznikie wierszy z zwroci ma nr wiersza
--@@rowcount to zmienna systemowa one maja podwojny add
Create Proc ml
	@lname varchar(40),
	@numRows int OUTPUT
	as
Select LastName from Person.Person
Where LastName like @lname
Set @numRows = @@rowcount;

--Wykorzystanie
--tak piszemy bez @out tez dziala
--musimy zaznaczyc ze jest tam Output bo inaczej mamy null
declare @out as int
Exec ml  @lname = 'Ab%' , @numRows = @out OUTPUT
Select @out as 'rows';

go;

-- to jest jakis print
declare @zmienna as int
set @zmienna = 10
print  @zmienna