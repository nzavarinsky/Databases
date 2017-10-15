select distinct maker,type from product
where type = all(select type from product where type = 'PC')