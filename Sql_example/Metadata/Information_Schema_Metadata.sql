--Information schema view to jest ustanaryzowane wczesniej w pliku sys_Tables_metadata byly
--uzywne Catalog views microsoftu .Microsoft zalaca swoje i jest tam wiecej danych a Sechema view jest crossplatform

select * from INFORMATION_SCHEMA.TABLES 
order by TABLE_SCHEMA,Table_Name;

--teraz kolumny
select * from INFORMATION_SCHEMA.Columns

--wszystko co z sys
Select * from INFORMATION_SCHEMA.Columns where Table_Schema = 'Person' and TABLE_NAME = 'Person'