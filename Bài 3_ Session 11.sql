create table products (
    id serial primary key,
    name varchar(100),
    price decimal(10,2),
    stock int
);
create table orders (
    id serial primary key,
    customer_name varchar(100),
    total_amount decimal(10,2)
);
create table order_items (
    id serial primary key,
    order_id int,
    product_id int,
    quantity int,
    price decimal(10,2)
);
insert into products(name, price, stock) values
('sp1', 100, 10),
('sp2', 200, 5);
begin;
update products set stock = stock - 2 where id = 1 and stock >= 2;
update products set stock = stock - 1 where id = 2 and stock >= 1;
insert into orders(customer_name, total_amount)
values ('nguyen van a', 0);
insert into order_items(order_id, product_id, quantity, price)
values 
(currval('orders_id_seq'), 1, 2, 100),
(currval('orders_id_seq'), 2, 1, 200);
update orders
set total_amount = (
    select sum(quantity * price)
    from order_items
    where order_id = currval('orders_id_seq')
)
where id = currval('orders_id_seq');
commit;
select * from products;
select * from orders;
select * from order_items;
update products set stock = 0 where id = 1;
begin;
update products set stock = stock - 2 where id = 1 and stock >= 2;
update products set stock = stock - 1 where id = 2 and stock >= 1;
insert into orders(customer_name, total_amount)
values ('nguyen van a', 0);
insert into order_items(order_id, product_id, quantity, price)
values 
(currval('orders_id_seq'), 1, 2, 100),
(currval('orders_id_seq'), 2, 1, 200);
rollback;
select * from products;
select * from orders;
select * from order_items;