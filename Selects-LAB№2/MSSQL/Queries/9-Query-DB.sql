SELECT name
FROM Ships AS s JOIN Classes AS cl1 ON s.class = cl1.class
WHERE
CASE WHEN numGuns = 9 THEN 1 ELSE 0 END +
CASE WHEN bore = 16 THEN 1 ELSE 0 END +
CASE WHEN displacement = 46000 THEN 1 ELSE 0 END +
CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
CASE WHEN launched = 1916 THEN 1 ELSE 0 END +
CASE WHEN s.class = 'Revenge' THEN 1 ELSE 0 END +
CASE WHEN country = 'Japan' THEN 1 ELSE 0 END > = 3