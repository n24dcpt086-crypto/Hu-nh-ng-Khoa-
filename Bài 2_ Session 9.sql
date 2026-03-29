create table users (
    user_id serial primary key,
    email varchar(100),
    username varchar(100)
);
create index idx_email_hash 
on users using hash (email) ;
explain 
select * from users 
where email = 'example@example.com';
