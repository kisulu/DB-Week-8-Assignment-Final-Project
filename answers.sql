-- Question 1: Student Records Management System

-- 1. Create the database
CREATE DATABASE StudentRecordsDB;

USE StudentRecordsDB;

-- 2. Create tables

-- Students table (basic student info)
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE
);

-- Courses table (subjects offered)
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- Instructors table (teachers/lecturers)
CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    head_of_department INT,
    FOREIGN KEY (head_of_department) REFERENCES Instructors(instructor_id)
);

-- Enrollment table (Many-to-Many between Students & Courses)
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(10) NOT NULL,
    year YEAR NOT NULL,
    grade VARCHAR(2),
    UNIQUE(student_id, course_id, semester, year),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- CourseAssignments table (Many-to-Many between Instructors & Courses)
CREATE TABLE CourseAssignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(10) NOT NULL,
    year YEAR NOT NULL,
    UNIQUE(instructor_id, course_id, semester, year),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
