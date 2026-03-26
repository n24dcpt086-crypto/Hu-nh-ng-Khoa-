CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    total_amount DECIMAL(10,2),
    order_date DATE
);
create table customers (
    customer_id serial primary key,
    full_name varchar(100),
    email varchar(100),
    phone varchar(20)
);
create table orders (
    order_id serial primary key,
    customer_id int references customers(customer_id),
    total_amount numeric(12,2),
    order_date date
);
create view v_order_summary as
select 
    c.full_name,
    o.total_amount,
    o.order_date
from orders o
join customers c on o.customer_id = c.customer_id;
select * from v_order_summary;
create view v_order_high_value as
select 
    c.full_name,
    o.total_amount,
    o.order_date
from orders o
join customers c on o.customer_id = c.customer_id
where o.total_amount >= 1000000;
update v_order_high_value
set total_amount = 1200000
where full_name = 'Nguyen Van A';
create view v_monthly_sales as
select 
    date_trunc('month', order_date) as month,
    sum(total_amount) as total_revenue
from orders
group by date_trunc('month', order_date)
order by month;
drop view v_order_summary;