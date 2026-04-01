create table customers(
id serial primary key,
name varchar(50),
credit_limit numeric
);
create table orders(
id serial primary key,
customer_id int,
order_amount numeric 
);
create or replace function check_credit_limit()
SELECT COALESCE(SUM(order_amount), 0)
CREATE OR REPLACE FUNCTION check_credit_limit()
RETURNS TRIGGER AS $$
DECLARE
    total_amount NUMERIC(10,2);
    credit NUMERIC(10,2);
BEGIN
INTO total_amount
FROM orders
WHERE customer_id = NEW.customer_id;
SELECT credit_limit
INTO credit
FROM customers
WHERE id = NEW.customer_id;
IF total_amount + NEW.order_amount > credit THEN
    RAISE EXCEPTION 'Vuot han muc tin dung!';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_check_credit
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION check_credit_limit();