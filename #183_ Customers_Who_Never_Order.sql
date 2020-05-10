Select a.Name as Customers
from Customers as a
left join
Orders as b
on a.Id = b.CustomerId
where b.Id is Null