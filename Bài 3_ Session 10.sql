create emloyees(
emloyee_id serial primary key,
name varchar(50),
position varchar(100),
salary decimal(10,2)
);
create table employees_log (
log_id serial primary key,
employee_id int,
operation varchar(10),
old_data text,
new_data text,
change_time timestamp default current_timestamp
);
create or replace function f_log_employees()
returns trigger as $$
begin

    if tg_op = 'insert' then
        insert into employees_log(employee_id, operation, old_data, new_data)
        values (
            new.id,
            'insert',
            null,
            row_to_json(new)::text
        );
        return new;

    elsif tg_op = 'update' then
        insert into employees_log(employee_id, operation, old_data, new_data)
        values (
            new.id,
            'update',
            row_to_json(old)::text,
            row_to_json(new)::text
        );
        return new;

    elsif tg_op = 'delete' then
        insert into employees_log(employee_id, operation, old_data, new_data)
        values (
            old.id,
            'delete',
            row_to_json(old)::text,
            null
        );
        return old;
    end if;

end;
$$ language plpgsql;
create trigger trg_log_employees
after insert or update or delete on employees
for each row
execute function f_log_employees();


