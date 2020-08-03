with product_count as (
    select maker, type, count(model) as count
    from Product
    group by maker,type)
select maker from product_count where type = 'printer' and count = (
    select max(count) from product_count p where p.maker = product_count.maker
);