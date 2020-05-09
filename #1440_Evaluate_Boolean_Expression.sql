with new_table as 
(Select 
    a.*, 
    b.value as left_value, 
    c.value as right_value
from expressions as a
left join
variables as b
on (a.left_operand = b.name)
left join
variables as c
on (a.right_operand = c.name))
Select 
    left_operand,
    operator,
    right_operand,
    (case when operator = ">" and (left_value > right_value) then "true"
     when operator = "<" and (left_value < right_value) then "true"
     when operator = "=" and (left_value = right_value) then "true"
     else "false" end) as value
from new_table;