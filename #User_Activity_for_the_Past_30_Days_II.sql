with sessions as
    (Select  
     user_id,
    count(distinct session_id) as count_sess
    from Activity where 
    activity_date between
    "2019-06-28" and "2019-07-27"
    group by user_id)
Select 
    ifnull(round(avg(count_sess),2),0) as average_sessions_per_user
from sessions
