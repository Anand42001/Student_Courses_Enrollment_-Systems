create database coll_data;
use coll_data;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 16),
    Email VARCHAR(100) UNIQUE,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F'))
);
INSERT INTO Students (StudentID, FirstName, LastName, Age, Email, Gender) VALUES
(1, 'Alice', 'Smith', 19, 'alice.smith@example.com', 'F'),
(2, 'Bob', 'Jones', 20, 'bob.jones@example.com', 'M'),
(3, 'Charlie', 'Brown', 21, 'charlie.brown@example.com', 'M'),
(4, 'Diana', 'Prince', 22, 'diana.prince@example.com', 'F'),
(5, 'Ethan', 'Hunt', 18, 'ethan.hunt@example.com', 'M'),
(6, 'Fiona', 'Gallagher', 23, 'fiona.g@example.com', 'F'),
(7, 'George', 'Wilson', 19, 'george.w@example.com', 'M'),
(8, 'Hannah', 'Lee', 20, 'hannah.lee@example.com', 'F'),
(9, 'Ivan', 'Petrov', 21, 'ivan.petrov@example.com', 'M'),
(10, 'Jenny', 'Kim', 20, 'jenny.kim@example.com', 'F'),
(11, 'Kyle', 'White', 22, 'kyle.white@example.com', 'M'),
(12, 'Laura', 'Brown', 19, 'laura.brown@example.com', 'F'),
(13, 'Mike', 'Johnson', 24, 'mike.johnson@example.com', 'M'),
(14, 'Nina', 'Chopra', 18, 'nina.chopra@example.com', 'F'),
(15, 'Oscar', 'Davis', 20, 'oscar.davis@example.com', 'M');
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT CHECK (CreditHours BETWEEN 1 AND 5),
    Department VARCHAR(50)
);
INSERT INTO Courses (CourseID, CourseName, CreditHours, Department) VALUES
(101, 'Database Systems', 4, 'CS'),
(102, 'Calculus I', 3, 'Mathematics'),
(103, 'Introduction to Psychology', 3, 'Psychology'),
(104, 'English Literature', 2, 'Arts'),
(105, 'Computer Networks', 4, 'CS');
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATEtime DEFAULT current_timestamp,
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, 101, '2025-05-01', 'A'),
(2, 1, 102, '2025-05-02', 'B'),
(3, 2, 101, '2025-05-01', 'B'),
(4, 3, 103, '2025-05-03', 'A'),
(5, 4, 104, '2025-05-01', 'C'),
(6, 5, 101, '2025-05-04', 'A'),
(7, 6, 105, '2025-05-02', 'B'),
(8, 7, 102, '2025-05-01', 'C'),
(9, 8, 103, '2025-05-03', 'B'),
(10, 9, 104, '2025-05-02', 'A'),
(11, 10, 101, '2025-05-01', 'B'),
(12, 11, 105, '2025-05-02', 'A'),
(13, 12, 102, '2025-05-03', 'C'),
(14, 13, 103, '2025-05-04', 'B'),
(15, 14, 104, '2025-05-02', 'A');

/*4.   to get student whose age greater than 18*/
SELECT * FROM Students WHERE Age > 18;  

/*5.  to get course credithours not equal to 3; it can get check by "<>" for not equal to*/
 SELECT * FROM Courses WHERE CreditHours !=3; 

/*6.    to get student first name start with A*/
 SELECT * FROM Students WHERE FirstName LIKE 'A%'; 

/*7.   it is compulsory to write datatype of variable, its default value stored how, and how it modified*/
 ALTER TABLE Enrollments  
MODIFY COLUMN EnrollmentDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
/* 8.  updated enrollments table to check current timestamp value */
select * from enrollments;
UPDATE Enrollments      
SET Studentid = 5
WHERE EnrollmentID = 2;
select * from enrollments;

/* 9.    List all enrollments with student and course names from foreign key constraint using enrollment table*/
SELECT S.FirstName, S.LastName, C.CourseName, E.Grade FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

/* 10.   Count of students enrolled per course by directly joining enrollment table and courses table*/
SELECT C.CourseName, COUNT(E.StudentID) AS TotalEnrolled FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;
