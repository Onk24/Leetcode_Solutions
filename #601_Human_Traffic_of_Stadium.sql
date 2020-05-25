# Write your MySQL query statement below
with new_t as
    (Select 
     id,
    visit_date,
    people,
    lag(people,2) over(order by visit_date) as prev2,
    lag(people,1) over(order by visit_date) as prev1,
    lead(people,1) over(order by visit_date) as next1,
    lead(people,2) over(order by visit_date) as next2
    from stadium)
Select id,
    visit_date,
    people
from new_t
where 
    ((prev2>=100 and prev1>=100 and people >=100)
    or (prev1>=100 and people >=100 and next1>=100)
    or (people>=100 and next1>=100 and next2>=100))
order by id
    

-- Another longer but faster solution
# Write your MySQL query statement below
with new_t as
    (Select
    id-2 as id2,
    id-1 as id1,
    id,
     (case when @prevp2>=100 and @prevp1>=100 and people>=100 then @prevd2 else null end) as Day2,
     (case when @prevp2>=100 and @prevp1>=100 and people>=100 then @prevd1 else null end) as Day1,
     (case when @prevp2>=100 and @prevp1>=100 and people>=100 then visit_date else null end) as Day0,
     @prevp2 as people2,
     @prevp2:=@prevp1 as people1,
     @prevp1:=people as people0,
     @prevd2:=@prevd1 as  new_date2,
     @prevd1:=visit_date as new_date1
     from
     stadium, 
     (Select @prevp1:=0, @prevp2:=0, @prevd1:=curdate(), @prevd2:=curdate()) as intials)
Select id, visit_date, cast(people as unsigned) as people 
from
((select id2 as id, day2 as visit_date, people2 as people
from new_t where day2 is not null)
 union
 (select id1 as id, day1 as visit_date, people1 as people
from new_t where day1 is not null)
 union
 (select id as id, day0 as visit_date, people0 as people
from new_t where day0 is not null)) as a
order by id
     