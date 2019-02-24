


DECLARE @Table TABLE(
        ID INT,
        Val INT
)

INSERT INTO @Table (ID,Val) SELECT 1, 3
INSERT INTO @Table (ID,Val) SELECT 2, NULL
INSERT INTO @Table (ID,Val) SELECT 3, 5
INSERT INTO @Table (ID,Val) SELECT 4, NULL
INSERT INTO @Table (ID,Val) SELECT 5, NULL
INSERT INTO @Table (ID,Val) SELECT 6, 2
INSERT INTO @Table (ID,Val) SELECT 7 ,4
INSERT INTO @Table (ID,Val) SELECT 8, Null

SELECT  *,
        ISNULL(Val, (SELECT TOP 1 Val FROM @Table WHERE ID < t.ID AND Val IS NOT NULL ORDER BY ID DESC))
FROM    @Table t


go;



DECLARE @Table TABLE(ID INT, Val INT)

INSERT INTO @Table (ID,Val) SELECT 1, 3
INSERT INTO @Table (ID,Val) SELECT 2, NULL
INSERT INTO @Table (ID,Val) SELECT 3, 5
INSERT INTO @Table (ID,Val) SELECT 4, NULL
INSERT INTO @Table (ID,Val) SELECT 5, NULL
INSERT INTO @Table (ID,Val) SELECT 6, 2
INSERT INTO @Table (ID,Val) SELECT 7 ,4
INSERT INTO @Table (ID,Val) SELECT 8, Null
---
--select t.*,
--       newscore = coalesce(val, max(val) over (partition by maxid)) 
--from (select a.*,
--        maxid =  max(case when Val is not null then id end) over (order by id) 
--        from  @Table as a
--     ) as t;

--wersja troche zmieniona najpierw jest szukana wartosc gdy nie jest null po id 
-- robina jest tablica z id tym samym dla null a pozniej jest brana coalesce partycjonowane po id
select  id , val, maxid,
	    newScore =  coalesce(val, max(val) over (partition by maxid))
from (select id, val,
        maxid =  max(case when Val is not null then id end) over (order by id) 
        from  @Table
     ) as t;

Select @@ROWCOUNT from Person.Person;