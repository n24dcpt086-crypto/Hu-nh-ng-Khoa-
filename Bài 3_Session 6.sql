create table customer (
    customer_id serial primary key,
    name varchar(100),
    email varchar(100),
    points int
);
insert into customer (name, email, points) values
('An Nguyen', 'an@gmail.com', 100),
('Binh Tran', 'binh@gmail.com', 200),
('Lan Anh', 'lan@gmail.com', 150),
('Minh An', null, 300),
('Hoa Le', 'hoa@gmail.com', 250),
('Tuan Pham', 'tuan@gmail.com', 180),
('An Nguyen', 'an2@gmail.com', 120);
select distinct name 
from customer ;
select * from customer 
where email is null ;
select * from customer 
order by points desc
limit 3
offset 1;

