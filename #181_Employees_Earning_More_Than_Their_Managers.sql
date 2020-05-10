Select a.Name as Employee
from Employee as a
left join 
Employee as b
on a.ManagerId = b.Id
where a.Salary > b.Salary