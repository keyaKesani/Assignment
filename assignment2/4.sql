-- create the tables

CREATE TABLE students (
    student_id INT PRIMARY KEY IDENTITY(100, 1),
    student_name VARCHAR(100) NOT NULL,
    student_major VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY IDENTITY(1, 1),
    course_name NVARCHAR(100) NOT NULL,
    course_department NVARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1000, 1),
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY IDENTITY(1000, 1),
    enrollment_id INT NOT NULL,
    grade_value DECIMAL(3, 1) NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);

-- populate the tables 

INSERT INTO students (student_name, student_major)
VALUES
    ('Alice Johnson', 'Computer Science'),
    ('Bob Smith', 'Mechanical Engineering'),
    ('Charlie Brown', 'Mathematics'),
    ('David White', 'Physics'),
    ('Emma Green', 'Biology');

INSERT INTO courses (course_name, course_department)
VALUES
    ('Introduction to Programming', 'Computer Science'),
    ('Mechanics', 'Mechanical Engineering'),
    ('Calculus I', 'Mathematics'),
    ('Modern Physics', 'Physics'),
    ('Genetics', 'Biology');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
    (100, 1, '2024-01-15'),
    (100, 3, '2024-01-16'),
    (101, 2, '2024-01-17'),
    (102, 3, '2024-01-18'),
    (103, 4, '2024-01-19'),
    (104, 5, '2024-01-20'),
    (101, 1, '2024-01-21'),
    (102, 4, '2024-01-22'),
    (103, 2, '2024-01-23'),
    (104, 3, '2024-01-24');

	INSERT INTO grades (enrollment_id, grade_value)
VALUES
    (1000, 9.5),
    (1001, 8.7),
    (1002, 9.0),
    (1003, 7.8),
    (1004, 9.3),
    (1005, 8.5),
    (1006, 9.1),
    (1007, 8.0),
    (1008, 9.4),
    (1009, 8.9);

-- solution Query

SELECT c.course_name, AVG(g.grade_value) AS avg
FROM courses c
LEFT JOIN enrollments e ON  c.course_id=e.course_id
LEFT JOIN grades g On e.enrollment_id=g.enrollment_id
GROUP BY c.course_name
