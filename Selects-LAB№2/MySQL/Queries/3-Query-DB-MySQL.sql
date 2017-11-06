SELECT DISTINCT p.maker,p.type, l.speed, l.hd
FROM laptop l 
JOIN product p ON p.model = l.model 
WHERE  l.hd >= 10