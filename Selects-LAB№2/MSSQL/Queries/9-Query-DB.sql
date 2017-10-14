select distinct name,
case
when numGuns=9 and bore=16 and displacement=46000 then '9,16,46000'
when type ='bb' and country='Japan' and launched=1916 then 'bb,Japan,1916'
else 'Nema spivpaddinya' 
end
from ships,Classes
