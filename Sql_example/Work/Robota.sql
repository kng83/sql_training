/****** Script for SelectTopNRows command from SSMS  ******/
select * from dbo.m1_zmiany

Select a.Md_rt, a.Walek_RT ,  b.Walek_SW, c.V_Papier  from
(select  _Value as Walek_RT , Modified_Date as MD_RT  
from m1_zmiany where _Name = 'M1.ZF.014_tanczacy_walek_RT') as a
JOIN 
(select  _Value as Walek_SW , Modified_Date as MD_SW 
from m1_zmiany where _Name = 'M1.ZF.015_tanczacy_walek_S/W') as b
ON b.MD_SW = a.MD_RT
Left JOIN
(select  _Value as V_Papier , Modified_Date as MD_Papier
from m1_zmiany where _Name = 'M1.ZF.006_predkosc_papieru') as c
ON c.MD_Papier = a.MD_RT







