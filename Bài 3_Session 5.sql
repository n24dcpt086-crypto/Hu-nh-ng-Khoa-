create table customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(100)
);
create table orders(
order_id int primary key,
customer_id int,
order_date date,
total_price numeric(10,2)
);
create table order_items(
items_id int primary key ,
order_id int ,
product_id int ,
quantity int,
price numeric(10,2),
);
select 
c.customer_name ,
sum(total_price) as total_revenue,
count(o.order_id) as order_count ,
from customer c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id , o.customer_name
having sum(total_revenue) > 2000;
select 
    c.customer_name,
    sum(o.total_price) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_price) > (
    select avg(total_revenue)
    from (
        select 
            customer_id,
            sum(total_price) as total_revenue
        from orders
        group by customer_id
    ) as temp;
select 
    c.city,
    sum(o.total_price) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.city
having sum(o.total_price) = (
    select max(total_revenue)
    from (
        select 
            c.city,
            sum(o.total_price) as total_revenue
        from customers c
        join orders o
        on c.customer_id = o.customer_id
        group by c.city
    ) as temp;
select 
    c.customer_name,
    c.city,
    sum(oi.quantity) as total_products,
    sum(oi.quantity * oi.price) as total_spent
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
group by c.customer_id, c.customer_name, c.city;
