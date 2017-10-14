select distinct product.maker 
from product 
where type='PC'
and maker = some(select product.maker from Product where type='Laptop');