SELECT DISTINCT maker 
FROM product 
WHERE type = 'PC'
and maker NOT IN(
	SELECT maker
	FROM product
	WHERE type='Laptop'
)