
drop table  Production.Example_ProductProductPhoto

SELECT *
INTO Production.Example_ProductProductPhoto
FROM Production.ProductProductPhoto ;

--Robimy delete wszystkiego

DELETE Production.Example_ProductProductPhoto ; 

--insert jest ciekawy !!!!!!!!!!!!!!!!!
 INSERT Production.Example_ProductProductPhoto
 SELECT * FROM Production.ProductProductPhoto 

--lub tradycyjnie
Insert Production.Example_ProductProductPhoto
(ProductID,ProductPhotoID,[Primary],ModifiedDate)
Values(899,1,1,GETDATE())


--usuwamy id od 1 d o 340
DELETE Production.Example_ProductProductPhoto
 Output deleted.*
 WHERE ProductID Between 1 and 340;

-- Dla szybkiego niszczenia tablicy dajemy trunctate
TRUNCATE TABLE Production.Example_ProductProductPhoto