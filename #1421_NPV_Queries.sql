Select 
    a.id,
    a.year,
    ifnull(b.npv,0) as npv
from queries as a
left join
npv as b
on 
(a.id = b.id
and a.year = b.year);