SELECT t1.point, t1.date, inc, `out`
FROM income_o t1 LEFT JOIN outcome_o t2 USING(point,date)
UNION
SELECT t2.point, t2.date, inc, `out`
FROM income_o t1 RIGHT JOIN outcome_o t2 USING(point,date);