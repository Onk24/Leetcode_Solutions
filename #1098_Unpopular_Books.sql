# Write your MySQL query statement below
with include_books as
    (Select 
    book_id,
    name
    from books
    where available_from < "2019-05-23"),
books_last_year as
    (Select 
     book_id, sum(quantity) as total_quantity
     from orders
     where dispatch_date>='2018-06-23'
     group by book_id)
Select 
    a.book_id,
    a.name
from include_books as a
left join books_last_year as b
on a.book_id = b.book_id
where total_quantity < 10 or total_quantity is null
     