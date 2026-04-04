create table accounts (
    account_id varchar(10) primary key,
    balance decimal(10,2)
);
create table transactions (
    id serial primary key,
    account_id varchar(10),
    amount decimal(10,2),
    transaction_type varchar(20)
);
insert into accounts values ('a', 1000.00);
begin;
update accounts
set balance = balance - 200
where account_id = 'a' and balance >= 200;
insert into transactions(account_id, amount, transaction_type)
values ('a', 200, 'withdraw');
commit;
select * from accounts;
select * from transactions;
begin;
update accounts
set balance = balance - 200
where account_id = 'a' and balance >= 200;
insert into transactions(account_id, amount, transaction_type)
values ('sai_id', 200, 'withdraw');
rollback;
select * from accounts;
select * from transactions;