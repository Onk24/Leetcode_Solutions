--Solution with window function
Select seller_id
from 
    (Select 
        seller_id, 
        rank() over(order by sum(price) desc) as price_rank
    from sales 
     group by seller_id) as b
where b.price_rank = 1;

--Another solution
Select seller_id
from sales
group by seller_id
having 
    sum(price) = (Select sum(price) 
                  from sales 
                  group by seller_id 
                  order by sum(price) desc
                  limit 1);