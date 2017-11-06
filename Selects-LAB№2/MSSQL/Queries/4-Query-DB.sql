SELECT distinct maker FROM Product
 where type = 'PC' and maker = some(select distinct maker from Product where type ='Laptop')