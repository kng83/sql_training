--transaction
--acid
--atomicy wszystkie zmiany maja sukces lub zadna
--consictency --db zostaje w stanie ok nie jest np zniszczona dane sa ok
--isolation -- kazda transakcja wystepuje odzielnie od innych i nie wplywa na inne trazakcje
--durability -- kazda transakcja musi przetrwac wylaczenie np servera lub uslugi

--Robimy transakcje
Begin tran ML
Update Person.Person
Set LastName ='Lang'

Select top 4 * from Person.Person;
--super
Rollback tran ML

Begin tran Sec
Update Person.Person
Set LastName = 'edy'
where BusinessEntityID = 1;

Select top 2 * from Person.Person;
--Gdy damy commit nie ma juz rollback
Commit tran Sec;
--gdy damy rollbarck musimy znowu dac begin tran;
Rollback tran Sec

