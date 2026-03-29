drop table if exists sales;
create table sales(
sale_id serial primary key ,
customer_id int,
product_id int,
sale_date date ,
amount numeric 
);
create view CustomerSales as
select 
customer_id ,
sum(amount) as total_amount 
from sales 
group by customer_id ;
select * from CustomerSales
where total_amount > 1000;
update sales
set amount = 1000
where customer_id = 1;