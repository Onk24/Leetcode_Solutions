Select 
    ifnull((Select Distinct Salary
    from Employee
    order by Salary Desc
    limit 1 OFFSET 1),
    NULL) as SecondHighestSalary