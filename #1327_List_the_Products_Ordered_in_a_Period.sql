Select 
    a.product_name, 
    sum(b.unit) as unit
from products as a 
join
orders as b
on a.product_id = b.product_id
where month(b.order_date) = 2
group by a.product_name
having sum(b.unit) >= 100;
