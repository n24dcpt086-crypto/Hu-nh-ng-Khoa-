create table employee (
    id serial primary key,
    full_name varchar(100),
    department varchar(50),
    salary numeric(10,2),
    hire_date date
);
insert into employee (full_name, department, salary, hire_date) values
('An Nguyen', 'IT', 8000000, '2023-03-01'),
('Binh Tran', 'HR', 7000000, '2022-05-10'),
('Lan Anh', 'IT', 9000000, '2023-07-15'),
('Minh An', 'Finance', 5000000, '2023-02-20'),
('Hoa Le', 'IT', 10000000, '2024-01-10'),
('Tuan Pham', 'HR', 5500000, '2023-11-05');
update employee
set salary = salary * 1.1
where department = 'IT';
select * from employee 
where salary < 6000000;
select *
from employee
where lower(full_name) like '%an%';
select *
from employee
where hire_date between '2023-01-01' and '2023-12-31';
