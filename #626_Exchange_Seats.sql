with new_t as
    (Select
        (case when id%2=1 then id+1 else id-1 end) as new_id,
        student
    from seat
    order by new_id)
Select 
    rank() over(order by new_id) as id,
    student
from 
    new_t