
--Update 
select * from Sales.SpecialOffer

UPDATE Sales.SpecialOffer
SET DiscountPct = 0.15
WHERE SpecialOfferID IN (10, 11, 12) 


--Update and view affected rows
--tu takze widac co zostalo usuniete a co zostalo
UPDATE Sales.SpecialOffer
SET DiscountPct *= 1.05
OUTPUT inserted.SpecialOfferID,
	 deleted.DiscountPct AS old_DiscountPct,
	 inserted.DiscountPct AS new_DiscountPct
WHERE Category = 'Customer' ;

------------------------------------------------
--takze mozliwosc z table variable
declare @updatedOffers table (
	 SpecialOfferID int,
	 old_DiscountPct float,
	 new_DiscountPct float
	)


UPDATE Sales.SpecialOffer
SET DiscountPct *= 1.05
OUTPUT inserted.SpecialOfferID,
	 deleted.DiscountPct AS old_DiscountPct,
	 inserted.DiscountPct AS new_DiscountPct
     INTO @updatedOffers
WHERE Category = 'Customer' ;

select * from @updatedOffers

-----------------------------------------------------
--dla duzych danych

CREATE TABLE dbo.RecipeChapter
 (
 ChapterID INT NOT NULL,
 Chapter VARCHAR(MAX) NOT NULL
 ) ;
GO

INSERT INTO dbo.RecipeChapter
 (ChapterID, Chapter)
VALUES (1,
 'At the beginning of each chapter you will notice
that basic concepts are covered first.') 

--przy duzej wielkosci dajemy .write
UPDATE RecipeChapter
SET Chapter.WRITE(' In addition to the basics, this chapter will also provide
recipes that can be used in your day to day development and administration.',
 NULL, NULL)
WHERE ChapterID = 1 

-- na tym tekscie tez zadziala
UPDATE RecipeChapter
SET Chapter =' In addition to the basics, this chapter will also provide
recipes that can be used in your day to day development and administration.'
WHERE ChapterID = 1 


Select * from dbo.RecipeChapter