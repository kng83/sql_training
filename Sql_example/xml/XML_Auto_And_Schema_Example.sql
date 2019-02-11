
--FOR XML AUTO
--Kazdy rzad tablicy jest nazwa taga
Select top 3 FirstName, LastName from Person.Person
For Xml Auto;

/*
<Person.Person FirstName="Syed" LastName="Abbas"/>
<Person.Person FirstName="Catherine" LastName="Abel"/>
<Person.Person FirstName="Kim" LastName="Abercrombie"/>
*/

--Mozemy dodac roota i zmienic wyglad
--Tu nie mozemy sobie wybrac nazwe wiersza 
 Select top 2 FirstName, LastName from Person.Person
For Xml Auto , Elements ,Root ('Persons');

/* przyklad dla 1 

<Persons>
	<Person.Person>
		<FirstName>Syed</FirstName>
		<LastName>Abbas</LastName>
	</Person.Person>
</Persons>
*/

--Teraz robimy Schema document dla xml
--Mamy pelny schemat ³¹cznie z nazwami zmiennych
 Select top 2 FirstName, LastName from Person.Person
 For xml Auto ,Elements ,XMLSchema('TestSchema')

 /*
 <xsd:schema targetNamespace="TestSchema" xmlns:schema="TestSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
    <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd"/>
    <xsd:element name="Person.Person"><xsd:complexType><xsd:sequence><xsd:element name="FirstName">
    <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks2012].[dbo].[Name]">
        <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
        <xsd:maxLength value="50"/>
        </xsd:restriction></xsd:simpleType></xsd:element><xsd:element name="LastName">
    <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks2012].[dbo].[Name]">
    <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
    <xsd:maxLength value="50"/></xsd:restriction></xsd:simpleType>
    </xsd:element></xsd:sequence></xsd:complexType></xsd:element>
</xsd:schema>
<Person.Person xmlns="TestSchema">
    <FirstName>Syed</FirstName>
    <LastName>Abbas</LastName>
</Person.Person>
<Person.Person xmlns="TestSchema">
     <FirstName>Catherine</FirstName>
     <LastName>Abel</LastName>
</Person.Person>
*/

--Aby otrzymac sam schemat robi query ktore nigdy sie nie uda
--Ale schemat dostaniemy

 Select top 2 FirstName, LastName from Person.Person
 Where 1=2
 For xml Auto ,Elements ,XMLSchema('TestSchema')