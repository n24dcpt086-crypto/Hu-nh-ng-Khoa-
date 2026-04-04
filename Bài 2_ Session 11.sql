create table accounts (
    account_id varchar(10) primary key,
    balance decimal(10,2)
);
insert into accounts values ('a', 1000.00), ('b', 500.00);
begin;
update accounts
set balance = balance - 100
where account_id = 'a';
update accounts
set balance = balance + 100
where account_id = 'b';
commit;
select * from accounts;
begin;
update accounts
set balance = balance - 100
where account_id = 'a';
update accounts
set balance = balance + 100
where account_id = 'sai_id';
rollback;
select * from accounts;