Select
    a.id,
    a.name
from Students as a
left join
Departments as b
on a.department_id = b.id
where b.name is null