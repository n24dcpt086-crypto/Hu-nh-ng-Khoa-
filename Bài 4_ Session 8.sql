DROP TABLE products;
create table products(
id serial primary key ,
name varchar(100),
price numeric,
discount_percent int
);
create or replace procedure calculate_discount(
p_id int,
out p_final_price numeric
)
language plpgsql
as $$
 DECLARE
v_price numeric ;
v_discount numeric;
begin 
select price , discount_percent 
into v_price, v_discount
from products 
where id = p_id;
if v_price is null then
raise notice 'Không tìm thấy sản phẩm!';
p_final_price := null ;
return;
end if;
v_discount := case 
when v_discount >50 then 50 
else v_discount  
end;
p_final_price := v_price - (v_price * v_discount / 100);
update products 
set price = p_final_price 
where id= p_id ;
end;
$$;



