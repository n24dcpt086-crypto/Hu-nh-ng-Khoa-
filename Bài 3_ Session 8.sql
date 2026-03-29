drop table if exists emloyees;
create table emloyees (
    emp_id serial primary key,
    name varchar(100),
    salary numeric,
    job_level int
);
create or replace procedure adjust_salary(
P_emp int ,
out p_new_salary numeric 
)
language plpgsql 
as $$
declare 
v_salary numeric ;
v_level int	;
begin 
select salary, job_level
into v_salary, v_level
from emloyees 
where emp_id = p_emp;
if v_salary is null then 
raise notice 'Khồn tìm thấy nhân viên! ';
p_new_salary := null;
return ;
end if;
if v_level = 1  then 
v_salary := v_salary * 1.05;
elsif v_level = 2 then 
v_salary := v_salary * 1.1;
elsif v_level = 3 then 
v_salary := v_salary * 1.15;
end if ;
update emloyees
set salary = v_salary 
where emp_id = p_emp ;
p_new_salary := v_salary ;
end;
$$;


