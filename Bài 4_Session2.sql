
create table elearning.students(
student_id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100) not null unique
);
create table elearning.instructors(
instructor_id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100) not null unique
);
create table elearning.courses(
course_id serial primary key,
course_name varchar(100) not null,
instructor_id int,
foreign key (instructor_id) references elearning.instructors(instructor_id)
);
create table elearning.enrollments(
enrollment_id serial primary key,
enroll_date date not null,
student_id int,
course_id int,
foreign key (student_id) references elearning.students(student_id),
foreign key (course_id) references elearning.coursescourse_id)
);
create table elearning.assignments(
assignment_id serial primary key,
title varchar(100) not null,
due_date date not null,
course_id int,
foreign key (course_id) references elearning.courses(course_id)
);
create table elearning.submission(
submission_id serial primary key,
submission_date date not null,
grade numeric(5,2) check (grade >= 0 and grade <=100),
assignment_id int,
student_id int,
foreign key (assignment_id) references elearning.assignments(assignment_id),
foreign key (student_id) references elearning.students(student_id)
);











