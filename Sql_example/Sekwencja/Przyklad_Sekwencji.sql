
-- Dropujemy sekwencje jesli istnieje
IF EXISTS (
	 SELECT 1 FROM sys.sequences AS seq
	 JOIN sys.schemas AS sch
	 ON seq.schema_id = sch.schema_id
     WHERE sch.name = 'dbo' AND seq.name = 'CH7Sequence'
	 )
	 Begin
     DROP SEQUENCE dbo.CH7Sequence
	 End;

--robimy sekwencje
CREATE SEQUENCE dbo.CH7Sequence AS INTEGER START WITH 1;
      DECLARE @ClassRank TABLE(
				 StudentID TINYINT,
				 Grade TINYINT,
				 SeqNbr INTEGER
				 );

INSERT INTO @ClassRank (StudentId, Grade, SeqNbr)
SELECT StudentId, Grade, NEXT VALUE FOR dbo.CH7Sequence OVER (ORDER BY Grade ASC)
FROM (VALUES (1, 100),
	 (2, 95),
	 (3, 85),
	 (4, 100),
	 (5, 99),
	 (6, 98),
	 (7, 95),
	 (8, 90),
	 (9, 89),
	 (10, 89),
	 (11, 85),
	 (12, 82)) dt(StudentId, Grade);
SELECT StudentId, Grade, SeqNbr
FROM @ClassRank;