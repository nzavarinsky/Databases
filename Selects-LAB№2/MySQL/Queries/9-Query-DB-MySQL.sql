SELECT sum(s.price)/sum(s.kil) as seredn FROM
(SELECT price,1 as kil FROM pc,product
 WHERE pc.model=product.model AND product.maker='A'
UNION all
 SELECT price,1 as kil FROM laptop,product
 WHERE laptop.model=product.model AND product.maker='A') as s