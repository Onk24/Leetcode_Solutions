# Write your MySQL query statement below
with follower_count as
    (Select followee,
    count(distinct follower) as total_followers
    from follow
    group by followee),
follower as
    (Select distinct follower
    from follow)
Select a.follower,
    b.total_followers as num
from follower as a
join follower_count as b
on
a.follower = b.followee
order by a.follower