drop table products;
create table products (
    product_id serial primary key,
    category_id int,
    price numeric,
    stock_quantity int
);
create index idx_category on products(category_id) ;
cluster products using idx_category ;
create index idx_price on products(price) ;
explain 
select * from products 
where category_id = 1
order by price;

