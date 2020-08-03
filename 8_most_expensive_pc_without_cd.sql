select serial_number, maker, price from PC
  left join Product
  on PC.model = Product.model
  where cd is null
  and maker in (
    select maker from Product where maker not in (
      select maker from Product
      where type not in ('pc')
      group by maker)
    group by maker)
order by price desc
fetch next 1 rows only;