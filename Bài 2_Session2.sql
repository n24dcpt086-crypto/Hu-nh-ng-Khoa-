CREATE SCHEMA university;

CREATE TABLE university.students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE university.courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

CREATE TABLE university.enrollments(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    enroll_date DATE,

    FOREIGN KEY (student_id) REFERENCES university.students(student_id),
    FOREIGN KEY (course_id) REFERENCES university.courses(course_id)
);
