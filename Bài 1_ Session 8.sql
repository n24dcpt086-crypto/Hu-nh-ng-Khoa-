drop table order_detail;
create table order_detail(
id serial primary key ,
order_id int ,
product_name varchar(100) ,
quantity int,
unit_price numeric 
) ;
create or replace procedure calculate_order_total(
order_id_input int ,
out total numeric 
)
language plpgsql
as $$
declare 
v_total numeric ;
begin
select sum(quanity * price)
into v_total
from order_detail
where order_id =order_id_input ;
if v_total is null then
        total := 0;
		else
        total := v_total;
    end if;

end;
$$;
