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

