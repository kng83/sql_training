--Estimated plan query is not executed . Stworzone do duzych zapytan by wiedziec jak
--zadziala
--Actual plan to sie uruchomi 
--Plany mozemy miec w text (deprecated) , xml ,graphical

--Use Set ShowPlan_Xml for estimated plan, Set Statistics xml for actual plans

--Example do xml Statistics
--Mozemy tu zamiast ON dac OFF
Set STATISTICS XML ON
Select p.LastName , p.FirstName , pp.PhoneNumber
from Person.Person as p
Join
Person.PersonPhone as pp
on p.BusinessEntityID = pp.BusinessEntityID;


--Teraz estimated plans 
--Musimy dac go tutaj bo to osobny wsad

Set SHOWPLAN_XML OFF
Go
Select p.LastName , p.FirstName , p.Demographics , pp.PhoneNumber
from Person.Person as p
Join
Person.PersonPhone as pp
on p.BusinessEntityID = pp.BusinessEntityID;

--Teraz wlaczmy przycisk Execution Plan i bedziemy mieli nowa karte
--Mamy to w zakladce query