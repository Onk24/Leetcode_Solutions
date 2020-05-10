Create Function getNthHighestSalary(N INT) returns int
begin
set n=n-1;
    return(
        Select 
        ifnull(
            (Select 
             distinct Salary
             from Employee
             order by Salary desc
             limit 1
             offset n)
            ,null) as getNthHighestSalary);
End