drop table if exists orders;
drop table if exists products;
create table products(
    product_id serial primary key,
    product_name varchar(255),
    category varchar(100)
);
create table orders(
    order_id int primary key,
    product_id int,
    quantity int,
    total_price numeric(10,2),
    foreign key (product_id) references products(product_id)
);
insert into products(product_id, product_name, category) values 
(1, 'Laptop Dell', 'Electronics'),
(2, 'IPhone 15', 'Electronics'),
(3, 'Bàn học gỗ', 'Furniture'),
(4, 'Ghế xoay', 'Furniture');
insert into orders(order_id, product_id, quantity, total_price) values
(101, 1, 2, 2200),
(102, 2, 3, 3300),
(103, 3, 5, 2500),
(104, 4, 4, 1600),
(105, 1, 1, 1100);
select 
    p.product_name,
    sum(o.total_price) as total_revenue
from products p
join orders o
    on p.product_id = o.product_id
group by p.product_id, p.product_name
having sum(o.total_price) = (
    select max(total_revenue)
    from (
        select 
            product_id,
            sum(total_price) as total_revenue
        from orders
        group by product_id
    ) as temp
);
select 
    p.category,
    sum(o.total_price) as total_sales
from products p
join orders o
    on p.product_id = o.product_id
group by p.category;
select distinct p.category
from products p
join orders o
    on p.product_id = o.product_id
where o.quantity = (
    select max(quantity)
    from orders
)
intersect
select p.category
from products p
join orders o
    on p.product_id = o.product_id
group by p.category
having sum(o.total_price) > 3000;