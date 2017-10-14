select distinct  maker,
	Laptop.model as LaptopModel,
	Laptop.price as LaptopPrice,
	Printer.model as PrinterModel,
	Printer.price as PrinterPrice,
	PC.model as PCModel,
	PC.price as PCPrice
  from Product,Laptop,Printer,PC
where maker = SOME(SELECT maker from Product where maker ='B')
