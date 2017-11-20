SELECT t.maker as m, (select 
case when COUNT(DISTINCT pc.model)=0 
then 1 else COUNT(DISTINCT pc.model)  end
   FROM product pr 
   JOIN pc ON pr.model=pc.model 
  WHERE pr.maker = t.maker ) pc,

(select case when COUNT(DISTINCT laptop.model)=0
 then 1 else COUNT(DISTINCT laptop.model)  end
   FROM product pr 
   JOIN laptop ON pr.model=laptop.model 
  WHERE pr.maker = t.maker  ) laptop,

(select case when COUNT(DISTINCT printer.model)=0 
then 1 else COUNT(DISTINCT printer.model) end
   FROM product pr 
   JOIN printer ON pr.model=printer.model 
  WHERE pr.maker = t.maker  ) printer

from product t
group by t.maker 