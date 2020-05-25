with avg_events as
    (Select
        event_type,
        avg(occurences) as avg_occurences
    from events
    group by event_type),
events_avg as
    (Select a.*,
    b.avg_occurences,
    (case when a.occurences > b.avg_occurences then 1 else 0 end) as more_than_avg
    from events as a
    left join 
    avg_events as b
    on a.event_type = b.event_type)
Select 
    business_id
from events_avg
group by business_id
having sum(more_than_avg) >=2