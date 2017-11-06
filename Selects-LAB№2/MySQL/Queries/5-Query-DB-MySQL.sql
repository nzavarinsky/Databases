SELECT DISTINCT maker
FROM product t1 JOIN pc t2 ON t1.model=t2.model
WHERE speed>=750 AND maker IN
( SELECT maker
FROM product t1 JOIN laptop t2 ON t1.model=t2.model
WHERE speed>=750 )