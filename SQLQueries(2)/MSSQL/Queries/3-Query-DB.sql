SELECT DISTINCT product.maker
FROM Laptop
INNER JOIN product ON Laptop.model = product.model
WHERE  Laptop.speed <=500