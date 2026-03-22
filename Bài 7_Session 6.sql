drop table if exists orders;

create table orders (
    id serial primary key,
    customer_id int,
    order_date date,
    total_amount numeric(10,2)
);
insert into orders (customer_id, order_date, total_amount) values
(1, '2023-01-10', 10000000),
(2, '2023-05-15', 20000000),
(3, '2023-10-20', 25000000),
(1, '2024-02-10', 15000000),
(2, '2024-06-18', 30000000),
(3, '2024-09-25', 40000000),
(4, '2024-12-01', 10000000);
select 
sum(total_amount) as total_revenue ,
count(*) as total_orders ,
avg(total_amount) as average_order_value 
from orders;
select 
    extract(year from order_date) as year,
    sum(total_amount) as total_revenue
from orders
group by extract(year from order_date);
select 
    extract(year from order_date) as year,
    sum(total_amount) as total_revenue
from orders
group by extract(year from order_date)
having sum(total_amount) > 50000000;
select * from orders
order by total_amount desc 
limit 5;