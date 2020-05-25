with cum_sum as
    (Select 
    person_id,
    person_name,
    weight,
    sum(weight) over(order by turn asc) as weight_sum,
    turn
    from Queue),
min_turn as 
    (Select 
    max(turn) as thous_turn
    from cum_sum 
    where weight_sum <= 1000)
Select 
    person_name
from Queue
where turn = (Select (thous_turn) as turn from min_turn)