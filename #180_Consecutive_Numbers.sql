with new_t as
    (Select
        num, 
        (case when (num=@prev1 and num=@prev2) then 1 else 0 end) as consec_f,
        @prev2:=@prev1,
        @prev1:=num
     from
        Logs,
        (Select
            @prev1:=null,
            @prev2:=null) as sq
     )
Select distinct Num as ConsecutiveNums
from new_t
where consec_f = 1;


--Another simple but computation heavy solution
Select distinct a.Num as ConsecutiveNums
from 
    Logs as a, 
    Logs as b, 
    Logs as c
where a.Id=b.Id-1 
    and a.Id = c.Id-2 
    and a.Num = B.Num 
    and a.Num = c.Num; 