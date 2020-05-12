with parents as
    (Select Distinct p_id
    from tree
    where p_id is not null)
Select 
    id,
    "Root" as Type
from tree
where p_id is null
Union
Select id,
    "Inner" as Type
from tree
where id in (Select
                p_id
            from parents)
            and p_id is not null
Union
Select distinct id,
    "Leaf" as Type
from tree
where id not in (Select 
                    p_id
                from parents)
            and p_id is not null;