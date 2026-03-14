create schema librarydb ;
create table librarydb.books (
books_id serial PRIMARY KEY,
title varchar(100) not null,
author varchar(50) not null ,
published_year int,
price real
);
