-- test database query
select first_name , last_name  , id from public."user";

-- return rows in json format
select row_to_json("user") from "user"; 


-- return rows in json format in array package
select
	array_to_json(array_agg(row_to_json(t)))
from
	(select * from "user" ) t
