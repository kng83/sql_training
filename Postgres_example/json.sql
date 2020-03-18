-- test database query
select first_name , last_name  , id from public."user";

-- return rows in json format
select row_to_json("user") from "user"; 


-- return rows in json format in array package
select array_to_json(array_agg(row_to_json(t))) from (select * from "user" ) t;


-- length of the array example varchar[] 
Select array_length(message, 1) from maintance_db.public.ticket where id =1;

-- length of the array using cardinality
Select cardinality(message) from maintance_db.public.ticket where id =1;


-- array lower element position
SELECT array_lower('[1:3]={1,2,3}'::int[], 1);  -- to bedzie 1

-- dlat kodu mojego z rzutowaniem typu na varchar
Select array_lower(message:: varchar[], 1) as some from maintance_db.public.ticket where id =2;

-- array replace zamien element na inny
SELECT array_replace(ARRAY[1,2,5,4], 1, 3); -- zamien 1 na 3 {3,2,5,4}

-- concat array
SELECT array_cat(ARRAY[1,2,3], ARRAY[4,5]); -- {1,2,3,4,5}