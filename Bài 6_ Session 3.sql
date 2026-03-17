create schema library;
create table library.Books(
book_id serial primary key,
title varchar(255),
author varchar(255),
published_year int ,
available boolean default true
);
create table library.members(
members_id serial primary key,
name varchar(255) ,
email varchar(255) unique ,
join_date date default current_date 
);



