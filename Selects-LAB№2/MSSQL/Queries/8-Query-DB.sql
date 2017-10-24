SELECT COUNT(DISTINCT  pc.model)
   FROM Product pr
   JOIN PC ON pr.model=pc.model
   WHERE Maker = 'A'
   UNION
   SELECT COUNT(DISTINCT pc.model)
   FROM Product pr
   JOIN PC ON pr.model=pc.model
   WHERE Maker = 'B'
   UNION
   SELECT COUNT(DISTINCT pc.model)
   FROM Product pr
   JOIN PC ON pr.model=pc.model
   WHERE Maker = 'C'


