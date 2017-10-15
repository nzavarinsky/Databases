SELECT product.maker, product.type 
FROM product 
LEFT JOIN pc ON pc.model = product.model 
WHERE product.type = 'PC' 
GROUP BY product.maker 
HAVING COUNT(product.model) = COUNT(pc.model)