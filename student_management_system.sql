-- ============================================
-- STUDENT MANAGEMENT SYSTEM
-- A mini SQL project demonstrating table design,
-- relationships, and common queries.
-- ============================================

-- ---------- 1. CREATE TABLES ----------

-- Table 1: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    enrollment_date DATE
);

-- Table 2: Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

-- Table 3: Enrollments
-- This table connects Students and Courses (many-to-many relationship)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ---------- 2. INSERT SAMPLE DATA ----------

INSERT INTO Students (student_id, name, email, phone, enrollment_date) VALUES
(1, 'Aman Sharma', 'aman.sharma@email.com', '9876543210', '2024-07-01'),
(2, 'Priya Verma', 'priya.verma@email.com', '9876543211', '2024-07-01'),
(3, 'Rohit Singh', 'rohit.singh@email.com', '9876543212', '2024-07-02'),
(4, 'Simran Kaur', 'simran.kaur@email.com', '9876543213', '2024-07-02'),
(5, 'Karan Mehta', 'karan.mehta@email.com', '9876543214', '2024-07-03');

INSERT INTO Courses (course_id, course_name, credits) VALUES
(101, 'Database Management Systems', 4),
(102, 'Web Development', 3),
(103, 'Data Structures', 4);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 101, 'A'),
(2, 1, 102, 'B'),
(3, 2, 101, 'A'),
(4, 3, 103, 'B'),
(5, 4, 102, 'A'),
(6, 5, 101, 'C'),
(7, 5, 103, 'B');

-- ---------- 3. QUERIES ----------

-- Q1: View all students
SELECT * FROM Students;

-- Q2: View all courses
SELECT * FROM Courses;

-- Q3: Show which student is enrolled in which course (JOIN across 3 tables)
SELECT Students.name, Courses.course_name, Enrollments.grade
FROM Enrollments
JOIN Students ON Enrollments.student_id = Students.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;

-- Q4: Count how many students are enrolled in each course
SELECT Courses.course_name, COUNT(Enrollments.student_id) AS total_students
FROM Enrollments
JOIN Courses ON Enrollments.course_id = Courses.course_id
GROUP BY Courses.course_name;

-- Q5: Find all students who scored an 'A' grade
SELECT Students.name, Courses.course_name
FROM Enrollments
JOIN Students ON Enrollments.student_id = Students.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Enrollments.grade = 'A';

-- Q6: Update a student's grade (example: change Karan's DBMS grade from C to B)
UPDATE Enrollments
SET grade = 'B'
WHERE student_id = 5 AND course_id = 101;

-- Q7: Delete a student's enrollment (example: remove enrollment_id 7)
DELETE FROM Enrollments
WHERE enrollment_id = 7;

-- Q8: Find students who are NOT enrolled in any course (if any)
SELECT Students.name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.student_id IS NULL;
