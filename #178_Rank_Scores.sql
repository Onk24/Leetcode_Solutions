--Easy solution
Select
    a.Score as Score,
    (Select 
        count(distinct Score)+1
        from Scores
        where Score > a.Score) as "Rank"
from Scores as a
order by Score Desc;


--Second solution
with CTE as
    (Select Score
    from Scores
    order by Score Desc)
Select 
    a.Score,
    convert(a.Rank,signed) as "Rank"
from
    (Select
        Score,
        (case
            when @prev>Score then @rank:=@rank+1
            else @rank
        end) as "Rank",
        @prev:=Score
    from 
        CTE,
        (Select @prev:=0,@rank:=1) as initials) as a