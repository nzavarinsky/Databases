SELECT sum(s.price)/sum(s.count) as sredn FROM 
(SELECT price,1 as count FROM pc,product 
 WHERE pc.model=product.model AND product.maker='A' 
UNION all 
 SELECT price,1 as count FROM laptop,product 
 WHERE laptop.model=product.model AND product.maker='A') as s