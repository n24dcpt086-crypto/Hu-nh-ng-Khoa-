create table products (
    id serial primary key,
    name varchar(100),
    stock int
);

create table orders (
    id serial primary key,
    product_id int,
    quantity int
);

create or replace function f_update_stock()
returns trigger as $$
begin
    if tg_op = 'insert' then
        update products
        set stock = stock - new.quantity
        where id = new.product_id;
        return new;

    elsif tg_op = 'update' then
        update products
        set stock = stock + old.quantity - new.quantity
        where id = new.product_id;
        return new;

    elsif tg_op = 'delete' then
        update products
        set stock = stock + old.quantity
        where id = old.product_id;
        return old;
    end if;
end;
$$ language plpgsql;

create trigger trg_update_stock
after insert or update or delete on orders
for each row
execute function f_update_stock();