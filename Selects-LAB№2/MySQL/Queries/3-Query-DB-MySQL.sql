select distinct maker,type,hd,speed from product,laptop
where type = 'Laptop'
and hd > 10