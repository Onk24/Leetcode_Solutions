# Write your MySQL query statement below
with max_s as
    (Select DepartmentId,
    max(Salary) as Max_Salary
    from Employee 
    group by DepartmentId)
Select 
    b.Name as Department,
    a.Name as Employee,
    a.Salary as Salary
from
    Employee as a
join 
    max_s
on a.DepartmentId = max_s.DepartmentId and
    a.Salary = max_s.Max_Salary
join
    Department as b
on a.DepartmentId = b.Id
;