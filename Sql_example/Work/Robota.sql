/****** Script for SelectTopNRows command from SSMS  ******/
select * from dbo.m1_zmiany

Select a.Modified_Date  , a.Walek_RT ,  b.Walek_SW,  c.V_Papier,  d.D_Roli from
(select  _Value as Walek_RT , Modified_Date   
from m1_zmiany where _Name = 'M1.ZF.014_tanczacy_walek_RT') as a
JOIN 
(select  _Value as Walek_SW , Modified_Date
from m1_zmiany where _Name = 'M1.ZF.015_tanczacy_walek_S/W') as b
ON a.Modified_Date   = b.Modified_Date  
Left JOIN
(select  _Value as V_Papier , Modified_Date
from m1_zmiany where _Name = 'M1.ZF.006_predkosc_papieru') as c
ON a.modified_Date   = c.modified_Date 
Left JOIN
(select  _Value as D_Roli , Modified_Date
from m1_zmiany where _Name = 'M1.ZF.007_srednica_roli_REAL') as d
ON a.modified_Date  = d.modified_Date 








