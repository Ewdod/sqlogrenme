use NorthWind;


select * from [Products Above Average Price]

select 
p1.UnitPrice, avg(p2.UnitPrice)
from Products p1
join products p2 on p1.UnitPrice>p2.UnitPrice

