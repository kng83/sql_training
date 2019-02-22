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
Select a.Modified_Date  , a.Walek_RT ,  b.Walek_SW,  c.V_Papier,  d.D_Roli from
	(
	select  _Value as Walek_RT , Modified_Date   
	from m1_zmiany where _Name = 'M1.ZF.014_tanczacy_walek_RT'
	) as a
JOIN 
	(
	select  _Value as Walek_SW , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.015_tanczacy_walek_S/W'
	) as b
	ON a.Modified_Date   = b.Modified_Date  
Left JOIN
	(
	select  _Value as V_Papier , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.006_predkosc_papieru'
	) as c
	ON a.modified_Date   = c.modified_Date 
Left JOIN
	(
	select  _Value as D_Roli , Modified_Date
	from m1_zmiany where _Name = 'M1.ZF.007_srednica_roli_REAL'
	) as d
	ON a.modified_Date  = d.modified_Date



---------------------------------------------------------
-- zrobmy cos z nasza tabela
Select * from #M1_Full
---

Declare @help varchar(50) ='5';

Select 
Walek_RT,
Modified_Date,
D_Roli,
Mutant1 = ISNULL(D_Roli, LAG(D_Roli) OVER (ORDER BY Modified_Date)),
Mutant2 = dbo.TakeFirstNonNull(D_Roli,@help) ,
D_Roli_2 = LAST_VALUE(D_Roli) OVER (ORDER BY Modified_Date desc Rows Unbounded Preceding ),
D_Sume = Last_VAlue( case when D_Roli is Null then D_Roli else D_Roli End) OVER (ORDER BY Modified_Date asc Rows Unbounded Preceding )
from #M1_Full
Order by Modified_Date 












