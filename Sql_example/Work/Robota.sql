/****** Script for SelectTopNRows command from SSMS  ******/
select * from dbo.m1_zmiany
 
-- =========================================
-- Create table template
-- =========================================
USE AdventureWorks2012
GO

IF OBJECT_ID('tempdb..#M1_Full') IS NOT NULL
 DROP TABLE #M1_Full
GO

create table #M1_Full(
	Modified_Date  DateTime ,
	Walek_RT Varchar(50),
	Walek_SW Varchar(50),
	V_Papier Varchar(50),
	D_Roli Varchar(50),
)
GO

Insert Into #M1_Full
Select t.Modified_Date  , a.Walek_RT ,  b.Walek_SW,  c.V_Papier,  d.D_Roli from
	(
	select Distinct Modified_Date 
	from m1_zmiany
	)as t
Full Join
	(
	select  _Value as Walek_RT , Modified_Date   
	from m1_zmiany where _Name = 'M1.ZF.014_tanczacy_walek_RT'
	) as a
	ON t.Modified_Date   = a.Modified_Date  
JOIN 
	(
	select  _Value as Walek_SW , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.015_tanczacy_walek_S/W'
	) as b
	ON t.Modified_Date   = b.Modified_Date  
Left JOIN
	(
	select  _Value as V_Papier , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.006_predkosc_papieru'
	) as c
	ON t.modified_Date   = c.modified_Date 
Left JOIN
	(
	select  _Value as D_Roli , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.007_srednica_roli_REAL'
	) as d
	ON t.modified_Date  = d.modified_Date


---------------------------------------------------------
-- zrobmy cos z nasza tabela
Select * from #M1_Full
---
go;

--Chaining cte
--Za pomoca tego duzego chainu mozna w locie nadac id i rowniez eliminujemy nulle
--Najepierw w jednym dodajemy id zalezne od daty
--Works as expected
With 
cte AS (
	Select 
		id = Count(@@ROWCOUNT) Over (order by Modified_Date),
		#M1_Full.*
	From #M1_Full
	),
cte2 AS (
	Select 
		 cte.*,
		 D_Roli_id =  max(case when D_Roli is not null then id end) over (order by id) ,
		 V_Papier_id = max(case when V_Papier is not null then id end) over (order by id),
		 Walek_RT_id = max(case when Walek_RT is not null then id end) over (order by id)
	From cte
	)

Select 
	--cte2.*,
	Modified_Date,
	newD_Roli = coalesce(D_Roli, max(D_Roli) over (partition by D_Roli_id)),
	newV_Papier = coalesce(V_Papier, max(V_Papier) over (partition by V_Papier_id)),
	newWalek_RT = coalesce(Walek_RT, max(Walek_RT) over (partition by Walek_RT_id))
From cte2
order by Modified_Date desc

















