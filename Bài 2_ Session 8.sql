create table inventory(
product_id serial primary key ,
name varchar(100),
quantity int
);
create or replace procedure check_stock(
p_id int,
p_qty int
)
language plpgsql 
as $$
declare 
v_quantity int;
begin 
select quantity 
into v_quantity 
from inventory 
where id = p_id ;
if v_quantity is null then
raise exception 'Không tìm thây sản phẩm!';
end if ;
if quantity < v_qty then
raise exception 'Không đủ hàng trong kho!';
else 
raise notice 'Đủ hàng để bán!';
end if ;
end;
$$;
