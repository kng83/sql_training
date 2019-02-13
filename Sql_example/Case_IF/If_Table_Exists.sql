
Select firstName , LastName Into #bobik from Person.Person;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Person' 
                 AND  TABLE_NAME = 'Address'))
BEGIN
    Select * from Person.Person;
	Print 'some'
END