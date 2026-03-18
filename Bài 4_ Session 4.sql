 drop table if exists products;
 create table products(
product_id serial primary key ,
name varchar(30),
category varchar(30),
price int ,
stock int,
manufacturer varchar(50)
);
insert into products(name, category, price, stock, manufacturer) values
('Laptop Dell XPS 13','laptop',25000000 ,12, 'Dell'),
('Chuột Logitech M90', 'phụ kiện', 150000, 50, 'Logitech' ),
('Bàn phím cơ Razer','Phụ kiện', 2200000, 0, 'Razer'),
('Macbook Air M2', 'Laptop', 32000000 ,7, 'Apple'),
('iPhone 14 Pro Max', 'Điện thoại',35000000 ,15, 'Apple'),
('Laptop Dell XPS 13', 'Laptop', 25000000 , 12, 'Dell'),
('Tai nghe AirPods 3', 'Phụ kiện',4500000 , null,'apple');
insert into products(name, category, price, stock, manufacturer) values
('Chuột Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');
update products set price = round(price * 1.10) where manufacturer ='Apple';
delete from products where stock=0;
select * from products where price between 1000000 and 30000000;
select * from products where stock is null;
select distinct manufacturer from products order by manufacturer;
select * from products order by price desc, name asc;
select * from products where name ilike '%laptop%';
select * from products order by price desc, name asc limit 2;







