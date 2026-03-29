drop table orders;
create table orders(
order_id serial primary key,
customer_id int,
order_date date ,
total_amount numeric 
);
explain analyze 
select * from orders 
where customer_id = 1;
create index idx_customer_id 
on orders(customer_id) ;
explain analyze 
select * from orders 
where customer_id = 1;


