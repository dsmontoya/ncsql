select serial_number, maker, price, type from Product left join ( 
  select model, serial_number, price from PC 
  union 
  select model, serial_number, price from Laptop 
  union 
  select model, serial_number, price from Printer) p on Product.model=p.model
order by price desc; 