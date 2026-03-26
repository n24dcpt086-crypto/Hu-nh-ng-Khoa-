
create table customer (
    customer_id serial primary key,
    full_name varchar(100),
    region varchar(50)
);
create table orders (
    order_id serial primary key,
    customer_id int references customer(customer_id),
    total_amount decimal(10,2),
    order_date date,
    status varchar(20)
);
create table product (
    product_id serial primary key,
    name varchar(100),
    price decimal(10,2),
    category varchar(50)
);
create table order_detail (
    order_id int references orders(order_id),
    product_id int references product(product_id),
    quantity int
);
CREATE VIEW v_revenue_by_region AS
SELECT 
    c.region,                      
    SUM(o.total_amount) AS total_revenue 
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id  
GROUP BY c.region; 
select region , total_revenue 
from v_revenue_by_region
order by total_revenue desc 
limit 3;
create materialized view mv_monthly_sales as
select date_trunc('month', order_date) as month,
       sum(total_amount) as monthly_revenue
from orders
group by date_trunc('month', order_date);
create view v_order_detail as
select
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
from orders
where status != 'cancelled'
with check option; 
update v_order_detail
set status = 'shipped'
where order_id = 1;
select order_id, status
from v_order_detail
where order_id = 1;
update v_order_detail
set status = 'cancelled'
where order_id = 2;
create or replace view v_revenue_by_region as
select
    c.region,
    sum(o.total_amount) as total_revenue
from customer c
join orders o on c.customer_id = o.customer_id
group by c.region;
create view v_revenue_above_avg as
select
    region,
    total_revenue
from v_revenue_by_region
where total_revenue > (
    select avg(total_revenue)
    from v_revenue_by_region
);
select region, total_revenue
from v_revenue_above_avg
order by total_revenue desc;
create view v_revenue_by_region as
select
    c.region,
    sum(o.total_amount) as total_revenue
from customer c
join orders o on c.customer_id = o.customer_id
group by c.region;
create view v_revenue_above_avg as
select
    region,
    total_revenue
from v_revenue_by_region
where total_revenue > (
    select avg(total_revenue)
    from v_revenue_by_region
);
select region, total_revenue
from v_revenue_above_avg
order by total_revenue desc;