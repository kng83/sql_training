

--Sprawdzamy checksum jezeli teraz nastapi zmiana w jakiej kolumnie to checksum dla kolumny wyjdzie inny
-- Dla tych wartosci suma kontrolna  wyszla 59
Select StudentId ,checksum_AGG(Grade) as GradeChecksumAgg
From (Values(1,100),
			(1,100),
			(1,100),
			(1, 99),
			(1, 99),
			(1, 98),
			(1, 98),
			(1, 95),
			(1, 95),
			(1, 95)
 ) dt (StudentId, Grade)
 Group by studentId;
