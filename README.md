1. Database Structure
   
🧑‍🎓 Students Table
Stores student personal details.

Includes constraints like:

PRIMARY KEY (StudentID)

NOT NULL on important fields

CHECK (Age >= 16)

UNIQUE (Email)

📘 Courses Table
Stores available courses.

Constraints:

PRIMARY KEY (CourseID)

NOT NULL, CHECK (CreditHours > 0)

📄 Enrollments Table
Maps students to courses.

Includes:

PRIMARY KEY (EnrollmentID)

FOREIGN KEY (StudentID) → Students(StudentID)

FOREIGN KEY (CourseID) → Courses(CourseID)

CHECK (Grade IN ('A','B','C','D','F'))

📈 2. Core SQL Features Demonstrated
✅ Constraints
PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK

Enforces data integrity

🔍 Clauses & Operators
SELECT, WHERE, LIKE, BETWEEN, IN, IS NULL

Filtering and searching data efficiently

🔗 Joins
INNER JOIN between Enrollments and Students/Courses

Example: See who enrolled in which course and what grade they received

📊 Aggregations
GROUP BY, COUNT, AVG, MAX, MIN

Example: Count of students per course

🧠 Logical & Comparison Operators
=, <>, >, <, >=, <=, AND, OR, NOT

📚 3. Sample Queries You Can Include
➕ Add a new enrollment
sql
Copy
Edit
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade)
VALUES (21, 15, 102, '2025-05-05', 'B');

🔍 Find all students enrolled in 'Database Systems'
sql
Copy
Edit
SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Database Systems';

📈 Count students enrolled per course
sql
Copy
Edit
SELECT C.CourseName, COUNT(E.StudentID) AS TotalEnrolled
FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

🎯 Students who scored an A
sql
Copy
Edit
SELECT S.FirstName, S.LastName, C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE E.Grade = 'A';

4.    Reports and Insights
Feature	SQL Function Used
Total Students	SELECT COUNT(*)
Course-wise Enrollments	GROUP BY CourseID
Gender Distribution	GROUP BY Gender
Top Performing Students	WHERE Grade = 'A'
Course Enrollment Trends	ORDER BY EnrollmentDate

✅ Conclusion
This project is:

Realistic – based on real-world college enrollment.

Comprehensive – covers constraints, joins, operators, and more.

Modular – easy to scale with triggers, procedures, views, or even a front-end.
