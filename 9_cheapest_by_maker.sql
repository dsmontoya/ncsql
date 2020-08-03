with p as (select p.model,serial_number, maker, price, speed, ram, hd, type 
  from Product
  left join ( 
  select model, serial_number, price, speed, ram, hd from PC 
  union 
  select model, serial_number, price, speed, ram, hd from Laptop) p on Product.model=p.model
  where (Product.type = 'pc' or Product.type = 'laptop')
  and hd = 1000)

select a.maker, a.serial_number, a.speed, a.ram, a.hd, a.price, a.type, a.model
  from p a, p b
  where a.model=b.model
  and a.price = (
    select min(price)
    from p
    where maker = a.maker
);