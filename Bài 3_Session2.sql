
create schema sales;
create table sales.customers (
customer_id serial primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) not null unique,
phone varchar(20) 
); 
create table sales.products(
product_id serial primary key,
product_names varchar(100)not null,
price numeric(10,2),
stock_quantity int not null
);
create table sales.orders(
order_id serial primary key,
customer_id int,
order_date date not null,
foreign key (customer_id)references sales.customers(customer_id)
);
create table sales.orderitems(
order_item_id serial primary key,
order_id int,
product_id int,
quantity int not null check (quantity >=1 ),
foreign key (order_id) references sales.orders(order_id) ,
foreign key (product_id) references sales.products(product_id)
);

