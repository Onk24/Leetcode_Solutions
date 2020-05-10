with CTE as
    (Select
     a.Request_at as Day,
     (case 
        when a.Status like "cancelled%" then 1
        else 0
     end) cancel_f
     from Trips as a
     left join Users as b
     on a.Client_id = b.Users_Id
     left join Users as c
     on a.Driver_id = c.Users_Id
     where 
        (a.Request_at between "2013-10-01" and "2013-10-03")
        and
        b.Banned ="No"
        and
        c.Banned= "No"
     )
Select Day,round(avg(cancel_f),2) as "Cancellation Rate"
from CTE
group by Day
order by Day;