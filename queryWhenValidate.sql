/****** Script for SelectTopNRows command from SSMS  ******/
/****** Script for SelectTopNRows command from SSMS  ******
*/



use Pyszczek
go 

Create view Validate as
select * ,
Case When Products.productColor = 'brown'
then 'valid'
else 'no valid'
end [Validate]
from Products 
go
