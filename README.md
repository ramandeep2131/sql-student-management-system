# Student Management System (SQL)

A relational database system built to manage student information, course enrollments, and academic performance tracking using SQL.

---

## 📌 Features & Key Concepts
- **Database Schema Normalization:** Structured design utilizing Primary and Foreign Key constraints to maintain 3NF data integrity.
- **Data Manipulation:** Efficient execution of `INSERT`, `UPDATE`, and `DELETE` queries.
- **Advanced Querying:** Utilization of multi-table `JOIN`s, `GROUP BY` aggregations, and subqueries for analytical reporting.

---

## 🗂️ Database Schema Overview

The database consists of three core relational tables:

+------------------+         +--------------------+         +-----------------+
|     Students     |         |    Enrollments     |         |     Courses     |
+------------------+         +--------------------+         +-----------------+
| student_id (PK)  |<-------1| enrollment_id (PK) |         | course_id (PK)  |
| first_name       |         | student_id (FK)    |1------->| course_name     |
| last_name        |         | course_id (FK)     |         | credits         |
| email            |         | grade              |         +-----------------+
| enrollment_date  |         +--------------------+
+------------------+
---
## 📊 Sample Queries & Analysis

### 1. Retrieve Course Enrollment & Student Details
```sql
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id; 
### 2. Calculate Average Grade / Performance by Course
```SQL
SELECT 
    c.course_name,
    COUNT(e.student_id) AS total_enrolled,
    AVG(e.grade) AS average_score
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
##🚀 How to Run the Project   
1.Open your SQL database environment (MySQL Workbench, PostgreSQL, SQLite, or DB Browser).

2.Download or copy the student_management_system.sql file.

3.Import or execute the script in your database client to instantiate tables, insert sample data, and run test queries
