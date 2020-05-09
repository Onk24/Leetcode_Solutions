Select 
	max(num) as num from
	(Select 
		num
	from my_numbers
	group by num
	having count(*) =1) as a;