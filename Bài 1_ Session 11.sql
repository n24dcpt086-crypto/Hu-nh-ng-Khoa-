create table flights (
flight_id varchar(10) primary key,
seats_available int
);
create table bookings (
booking_id serial primary key,
customer_name varchar(100),
flight_id varchar(10)
);
insert into flights values ('vn123', 100);
begin;
update flights
set seats_available = seats_available - 1
where flight_id = 'vn123';
insert into bookings(customer_name, flight_id)
values ('nguyen van a', 'vn123');
commit;
select * from flights;
select * from bookings;
begin;
update flights
set seats_available = seats_available - 1
where flight_id = 'vn123';
insert into bookings(customer_name, flight_id)
values ('nguyen van a', 'sai_id');
rollback;
select * from flights;
select * from bookings;