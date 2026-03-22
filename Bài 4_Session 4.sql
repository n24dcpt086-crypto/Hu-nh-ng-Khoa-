create table orders (
    order_id serial primary key,
    order_date date,
    total_amount numeric(12,2),
    status varchar(50)
);
insert into orders (order_date, total_amount, status) values
('2024-10-01', 600000, 'Completed'),
('2024-10-05', 450000, 'Pending'),
('2024-10-10', 800000, 'Completed'),
('2024-09-20', 300000, 'Cancelled'),
('2024-10-15', 700000, 'Processing');
select * from orders 
where total_amount > 500000;
select * from orders 
where order_date between '1/10/2024' and '31/10/2024';
select * from orders 
where status <> 'complete';
select * from orders 
order by order_date desc 
limit 2;

