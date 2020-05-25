Select 
    a.Id
from 
Weather as a
join 
Weather as b
on (TO_DAYS(a.RecordDate) = (TO_DAYS(b.RecordDate)+1))
where a.Temperature > b.Temperature
