with gain_loss as
    (Select 
    stock_name,
    (case when operation = "Buy" then price*(-1) else price end) as gain
     from Stocks)
Select 
    stock_name,
    sum(gain) as capital_gain_loss
from gain_loss
group by stock_name