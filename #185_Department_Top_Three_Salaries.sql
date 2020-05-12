with ordered_E as 
    (Select Name, Salary, DepartmentId
    from Employee
    order by DepartmentId, Salary Desc),
ranked_E as
    (Select
        Name,
        Salary,
        DepartmentId,
        (case when 
            DepartmentId =@prevD then
            (case when Salary<@prevS then @r:=@r+1
             else @r end)
            else @r:=1 end) as ranks,
        @prevS:=Salary,
        @prevD:=DepartmentId
     from
        ordered_E,
        (Select @r:=1, @prevS:=0, @prevD:=0) as initials)
Select a.Name as Department,
     b.Name as Employee,
     b.Salary as Salary
from
     Department as a
join
     ranked_E as b
on a.Id = b.DepartmentId
where ranks<=3
order by Department,
     Salary Desc;