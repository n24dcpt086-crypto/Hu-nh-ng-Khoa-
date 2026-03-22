drop table if exists courses;
create table courses (
    course_id serial primary key,
    course_name varchar(255),
    price numeric(12,2),
    duration int
);
insert into courses (course_name, price, duration) values
('sql cơ bản', 500000, 20),
('sql nâng cao', 1200000, 40),
('python cho người mới', 800000, 25),
('java web', 2000000, 35),
('demo khóa học c++', 300000, 10),
('phân tích dữ liệu sql', 1500000, 50);
update courses 
set price = price * 1.15
where duration > 30;
delete from courses 
where lower(course_name) like '%demo%';
select * from courses
where lower(course_name) like '%sql%';
select * from courses 
where price between 500000 and 2000000 
order by price desc 
limit 3;
