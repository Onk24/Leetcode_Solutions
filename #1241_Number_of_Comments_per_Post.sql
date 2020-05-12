with parents as
    (Select distinct sub_id as parent_id
    from Submissions
    where parent_id is Null)
Select 
    a.parent_id as post_id,
    count(distinct b.sub_id) as number_of_comments
from parents as a
left join
Submissions as b
on a.parent_id = b.parent_id
group by a.parent_id;