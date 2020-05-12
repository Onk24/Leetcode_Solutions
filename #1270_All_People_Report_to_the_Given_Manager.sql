with new_t1 as
    (Select
        employee_id
    from Employees
     where manager_id = 1 and employee_id != 1),
new_t2 as
    (Select employee_id 
     from Employees
     where manager_id in 
     (Select * from new_t1)),
new_t3 as
    (Select employee_id
    from Employees
    where manager_id in
    (Select * from new_t2))
Select * from new_t1
union 
Select * from new_t2
union
Select * from new_t3;