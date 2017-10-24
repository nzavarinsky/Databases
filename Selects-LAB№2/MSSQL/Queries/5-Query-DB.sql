
SELECT maker
FROM product pr2
WHERE pr2.type LIKE 'Printer' AND
pr2.maker IN (
SELECT pr.maker
FROM product pr
WHERE pr.model IN (
SELECT pc3.model
FROM pc AS pc3
WHERE pc3.speed = (
SELECT max(speed)
FROM pc
)
GROUP BY pc3.model
)
GROUP BY maker
)
GROUP BY maker
