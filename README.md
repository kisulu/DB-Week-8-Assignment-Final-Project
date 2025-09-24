# 📘 Student Records Management System

## 📌 Project Overview

This project is a relational database system for managing student records using **MySQL**.  
It is designed to handle students, courses, instructors, departments, and enrollments efficiently while ensuring data integrity through proper constraints and relationships.

---

## 🏗️ Database Features

- **Students Table** → Stores student personal information.  
- **Courses Table** → Contains course details such as course code and credits.  
- **Instructors Table** → Stores faculty members’ information.  
- **Departments Table** → Organizes instructors into departments with a head of department.  
- **Enrollment Table** → Tracks student course enrollments *(Many-to-Many)*.  
- **CourseAssignments Table** → Tracks which instructors teach which courses *(Many-to-Many)*.

---

## ⚙️ Relationships

- **One-to-One** → `Department` ↔ `Head of Department (Instructor)`  
- **One-to-Many** → `Department` ↔ `Instructors`  
- **Many-to-Many** → `Students` ↔ `Courses` *(via Enrollment)*  
- **Many-to-Many** → `Instructors` ↔ `Courses` *(via CourseAssignments)*

---

## 🚀 How to Use

1. Open **MySQL Workbench** (or any MySQL environment).
2. Run the SQL script:
   ```sql
   source student_records.sql;
