DROP TABLE IF EXISTS products;
create table products(
product_id serial primary key,
name varchar(50),
price numeric,
last_modified TIMESTAMP
);
create or replace function update_last_modified()
returns trigger 
as $$
begin 
new.last_modified := current_timestamp;
return new;
end ;
$$ language plpgsql ;
create trigger trg_update_last_modified
before update on products 
for each  row
execute function update_last_modified();
INSERT INTO products (name, price, last_modified)
VALUES 
('Laptop', 1500.00, CURRENT_TIMESTAMP),
('Mouse', 20.00, CURRENT_TIMESTAMP),
('Keyboard', 50.00, CURRENT_TIMESTAMP);
UPDATE products
SET price = 2000
WHERE product_id = 1;
select * from products;
