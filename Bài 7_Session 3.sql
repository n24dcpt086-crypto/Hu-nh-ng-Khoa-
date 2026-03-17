create schema sales;
create table sales.members(
member_id serial primary key
);
create table sales.products(
product_id serial primary key,
product_name varchar(255),
price numeric(5,2),
stock_quantity int
);
create table sales.orders(
order_id serial primary key,
order_date date default current_date,
member_id int,
foreign key(member_id) references sales.members(member_id)
);
create table sales.orderdetails(
order_details_id serial primary key,
quantity int,
order_id int ,
product_id int,
foreign key (order_id) references sales.orders(order_id),
foreign key (product_id) references sales.products(product_id)
);


