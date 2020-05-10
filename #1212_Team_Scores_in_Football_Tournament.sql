# Write your MySQL query statement below
with new_t as
    (Select 
        host_team,
        guest_team,
        (case when host_goals > guest_goals then 3
        when host_goals = guest_goals then 1
        else 0 end) as host_pts,
        (case when host_goals < guest_goals then 3
        when host_goals = guest_goals then 1
        else 0 end) as guest_pts
     from Matches)
Select
    a.team_id,
    a.team_name,
    (ifnull(b.total_host_pts,0) + ifnull(c.total_guest_pts,0)) as num_points
from teams as a
left join
    (Select
    host_team,
    sum(host_pts) as total_host_pts
    from new_t
    group by host_team) as b
on a.team_id = b.host_team
left join
    (Select
    guest_team,
    sum(guest_pts) as total_guest_pts
    from new_t
    group by guest_team) as c
on a.team_id = c.guest_team
group by a.team_id, a.team_name
order by num_points desc, team_id;