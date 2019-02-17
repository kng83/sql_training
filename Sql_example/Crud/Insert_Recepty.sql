
select * from production.Location

INSERT INTO Production.Location
 (Name, CostRate, Availability)
VALUES ('Wheel Storage', 11.25, 80.00) 


SELECT Name, CostRate, Availability FROM Production.Location
WHERE Name = 'Wheel Storage' ;

INSERT Production.Location
 (Name, CostRate,Availability,ModifiedDate)
VALUES ('Wheel Storage 3',11.25, 80.00, DEFAULT)

--aby  wyswietlic to co bylo wrzucane dajemy output
INSERT INTO HumanResources.Department ( Name, GroupName)
Output  inserted.*
VALUES ( 'Database foka 2', 'Information Technology')
---------------------------------------------------------
--robimy variable table mozna tu zmienic varchar tez
--to co wrzucamy mozemy takze dac do tablicy tymczasowej

declare @insertedValue table  (DepartmentID smallint, Name varchar(30), GroupName varchar(50),
	ModifiedDate datetime)

INSERT INTO HumanResources.Department ( Name, GroupName)
Output   inserted.* INTO @insertedValue
VALUES ( 'Database foka 5', 'Information Technology')

Select * from @insertedValue;

-----------------------------------------------------------
--normalnie identity nie mozna id zmieniac a tu dajac na on mozemy zmienic
--nalezy pamietac o powrocie
select * from HumanResources.Department;
SET IDENTITY_INSERT HumanResources.Department ON
INSERT HumanResources.Department (DepartmentID, Name, GroupName)
VALUES (17, 'Database Services', 'Information Technology')
SET IDENTITY_INSERT HumanResources.Department OFF