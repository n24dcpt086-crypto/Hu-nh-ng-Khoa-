create table sales(
sale_id serial primary key,
customer_id int,
amount numeric,
sale_date date 
);
create or replace procedure calculate_total_sales(
start_date date,
end_date date,
out total numeric
)
language plpgsql 
as $$
begin 
select sum(amount)
into total 
from sales 
where sale_date between start_date and end_date ;
if total is null then
total := 0 ;
end if;
raise notice 'Tổng doanh thu: %', total ;
end;
$$;
call calculate_total_sales('2024-01-01', '2024-12-31', null);
