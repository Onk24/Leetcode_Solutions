# Write your MySQL query statement below
with max_m as 
    (Select 
        Id, 
        max(Month) Max_month
    from Employee
    group by Id),
cum_sum as
    (Select 
        a.Id,
        a.Month, 
        Sum(b.Salary) as Cum_salary
     from Employee as a
     join
     Employee as b
     on (a.Id = b.Id and a.Month>=b.Month and a.Month<(b.Month+3))
     group by a.Id, a.Month)
Select 
    a.Id,
    a.Month,
    a.Cum_salary as Salary
from cum_sum as a
join
max_m as b
on (a.Id=b.Id and a.Month!=b.Max_month)
order by a.Id, a.Month Desc;