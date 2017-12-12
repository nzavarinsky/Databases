SELECT  name from Passenger
where SUBSTRING(name, CHARINDEX(' ', name + ' ') + 1, 8000) NOT LIKE 'j%' 