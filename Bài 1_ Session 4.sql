drop table students;
create table students(
id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    major_name VARCHAR(50),
    gpa DECIMAL(3,2)
);
INSERT INTO students(name, age, major_name, gpa) VALUES
('An', 20, 'CNTT', 3.5),
('Bình', 21, 'Toán', 3.2),
('Cường', 22, 'CNTT', 3.8),
('Dương', 20, 'Vật lý', 3.0),
('Em', 21, 'CNTT', 2.9);
insert into students(name, age, major_name, gpa)
values('Hùng', 23,'Hóa học', 3.4);
update students set gpa=3.6 where name='Bình';
delete from students where gpa<3.0;
select name ,major_name from students order by gpa desc;
select DISTINCT name from students where major_name = 'CNTT';
select * from students where gpa between 3.0 and 3.6;
select * from students where name like 'c%';
select * from students order by name asc limit 3;
