create table product (
    id serial primary key,
    name varchar(100),
    category varchar(50),
    price numeric(10,2),
    stock int
);
insert into product(name, category, price, stock) values
('Laptop Dell', 'Điện tử', 15000000, 10),
('IPhone 15', 'Điện tử', 20000000, 5),
('Tai nghe', 'Điện tử', 500000, 50),
('Bàn học', 'Nội thất', 3000000, 20),
('Ghế xoay', 'Nội thất', 2500000, 15);
select * from product;
select * from product
order by price desc 
limit 3;
select *
from product
where category = 'Điện tử'
and price < 10000000;
select * from product
order by stock asc;


