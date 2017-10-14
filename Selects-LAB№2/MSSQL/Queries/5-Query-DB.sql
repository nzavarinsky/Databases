select distinct maker, speed from Product, PC
where type = 'Printer'
and speed > 500
