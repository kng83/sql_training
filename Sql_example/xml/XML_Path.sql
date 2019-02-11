--For xml Path

Select top 3 FirstName ,LastName from Person.Person
For XML Path
/*
<row>
<FirstName>Syed</FirstName>
<LastName>Abbas</LastName>
</row>
*/

--Tak jak w rawie mozna nazwac wiersze i zrobic root tag
Select top 3 FirstName ,LastName from Person.Person
For XML Path ('Employee'), Elements,Root ('Employees');

--Teraz robimy alias do id i to bedzie atrybut np dla Employee
Select top 3 BusinessEntityID as [@id], FirstName ,LastName from Person.Person
For XML Path ('Employee'), Elements,Root ('Employees');

/*OUTPUT
<Employees>
	<Employee id="285">
		<FirstName>Syed</FirstName>
		<LastName>Abbas</LastName>
	</Employee>
	<Employee id="293">
		...
	...
</Employees>
*/
--Mozemy tez zmienic zagniezdzenie xml
Select top 1  FirstName "P/D",LastName from Person.Person
For XML Path ('Employee'), Elements;

/*
<Employee>
	<P>
		<D>Syed</D>
	</P>
		<LastName>Abbas</LastName>
</Employee>
*/