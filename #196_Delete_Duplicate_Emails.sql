Delete A.* from Person A
join 
Person B
where A.email = B.email
and A.Id > B.Id;


--Slower solution
with min_id as
    (Select min(Id)
    from Person
    group by Email)
Delete
from Person
where Id not in 
    (Select * 
     from min_id)