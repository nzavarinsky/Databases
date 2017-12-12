select maker,count(type) from Product 
where type = 'PC'
group by maker
select model, avg(price)from pc 
where price < 800
group by model

