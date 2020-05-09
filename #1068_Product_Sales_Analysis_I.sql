Select
    a.product_name,
    b.year,
    b.price
from product as a
join
sales as b
using(product_id)
