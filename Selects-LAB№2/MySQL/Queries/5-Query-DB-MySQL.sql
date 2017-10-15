select distinct product.maker,laptop.speed,pc.speed 
from product,laptop,pc
where laptop.speed >= 750
and pc.speed > 750