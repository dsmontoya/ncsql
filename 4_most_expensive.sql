with p as (select price, maker, p.model as model from Product 
  left join ( 
    select model, price from PC 
    union 
    select model, price from Laptop 
    union 
    select model, price from Printer) p on Product.model=p.model) 
select p.maker, p.model, p.price from p, Product where p.maker = Product.maker and p.model = Product.model and price = ( 
  select max(price) from p where maker = Product.maker 
)