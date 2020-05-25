with total_friends as
    (Select requester_id
    from request_accepted
    union all
    Select accepter_id
    from request_accepted)
Select
    requester_id as id,
    count(*) as num
from total_friends
group by requester_id
order by num desc limit 1