create table book (
    book_id serial primary key,
    title varchar(255),
    author varchar(100),
    genre varchar(50),
    price decimal(10,2),
    description text,
    created_at timestamp default current_timestamp
);
select * from book 
where author ilike '%rowling%';
create extension if not exists pg_trgm;
create index idx_book_author_trgm
on book using gin (author gin_trgm_ops);
select * from book 
where genre = 'fantasy';
create index idx_book_genre
on book(genre);
explain analyze
select * from book 
where author ilike '%rowling%';
explain analyze
select * from book 
where genre = 'fantasy';
create index idx_book_genre
on book(genre);
create index idx_book_description_gin
on book using gin(to_tsvector('english', description));
cluster book using idx_book_genre;
explain analyze
select * from book where genre = 'fantasy';
explain analyze
select * from book where genre = 'fantasy';
explain analyze ;
explain analyze
select * from book
where to_tsvector('english', description)
@@ to_tsquery('magic');
