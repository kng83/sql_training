/****** Script for SelectTopNRows command from SSMS  ******/



--Descending example
use AdventureWorks2012;

select top 40 
	LastName , FirstName , EmailPromotion
	from Person.Person
	Order by LastName ASC, EmailPromotion DESC;
