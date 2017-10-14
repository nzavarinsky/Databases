SELECT DISTINCT maker FROM Product
WHERE type='Laptop' OR
type = SOME(SELECT maker FROM Product
WHERE type = 'PC')
SELECT DISTINCT maker FROM Product
WHERE type='PC' OR
type = SOME(SELECT maker FROM Product
WHERE type = 'Laptop')