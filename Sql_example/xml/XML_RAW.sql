--XML 3 rozne formaty outputu
--xml raw 
--xml auto
--xml path

--For xml raw
Select top 3 FirstName, LastName  from Person.Person
FOR XML RAW;

--OUTPUT
/*
<row FirstName="Syed" LastName="Abbas" />
<row FirstName="Catherine" LastName="Abel" />
<row FirstName="Kim" LastName="Abercrombie" />
*/

--aby dodac elementy
Select top 3 FirstName, LastName  from Person.Person as SPerson
FOR XML RAW,Elements;

/*OUTPUT
<row>
	<FirstName>Syed</FirstName>
	<LastName>Abbas</LastName>
</row>
<row>
	<FirstName>Catherine</FirstName>
	<LastName>Abel</LastName>
</row>
*/

--zmieniamy nazwe tagu row na employee i dodajemy root tag employees
Select top 2 FirstName, LastName  from Person.Person as SPerson
FOR XML RAW ('Employee'),Elements, Root ('Employees');

/* OUTPUT

<Employees>
	<Employee>
		<FirstName>Syed</FirstName>
		<LastName>Abbas</LastName>
	</Employee>
	<Employee>
		<FirstName>Catherine</FirstName>
		<LastName>Abel</LastName>
	</Employee>
</Employees>

*/