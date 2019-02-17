
--tak mozemy zrobic szybka tablice wartosci

SELECT *
FROM (VALUES ('George', 'Washington'),
 ('Thomas', 'Jefferson'),
 ('John', 'Adams'),
 ('James', 'Madison'),
 ('James', 'Monroe'),
 ('John Quincy', 'Adams'),
 ('Andrew', 'Jackson'),
 ('Martin', 'Van Buren'),
 ('William', 'Harrison'),
 ('John', 'Tyler')
 ) as dtPresidents(FirstName, LastName);