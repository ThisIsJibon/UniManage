CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username INTEGER NOT NULL UNIQUE,
    passhash VARCHAR NOT NULL
);

INSERT INTO users(username, passhash) values($1,$2);


-- create student table


CREATE TABLE Student (
  reg_no INTEGER PRIMARY KEY,
  name TEXT,
  dept_id TEXT,
  session INTEGER,
  address TEXT
);


INSERT INTO Student (reg_no,name,dept_id,session,address) 
  VALUES (2018331054,'Mahinur', 'CSE', 2018,'Sylhet');


SELECT * FROM Student;



-- create student_email table


CREATE TABLE Student_Email (
  reg_no INTEGER PRIMARY KEY,
  email TEXT
);


INSERT INTO Student_Email (reg_no,email) 
  VALUES (2018331054,'m@gmail.com');


SELECT * FROM Student_Email;


-- create student_contact table



CREATE TABLE Student_Contact (
  reg_no INTEGER PRIMARY KEY,
  contact INTEGER
);


INSERT INTO Student_Contact (reg_no,contact) 
  VALUES (2018331054,01111345683);


SELECT * FROM Student_Contact;


-- create teacher table


CREATE TABLE Teacher (
  teacher_id INTEGER PRIMARY KEY,
  name TEXT,
  dept_id TEXT NOT NULL,
  designation TEXT NOT NULL
);


INSERT INTO Teacher (teacher_id,name,dept_id,designation) 
  VALUES (1,'Mr X', 'CSE','Lecturer');


SELECT * FROM Teacher;



-- create teacher_email table



CREATE TABLE Teacher_Email (
  teacher_id INTEGER PRIMARY KEY,
  email TEXT
);


INSERT INTO Teacher_Email (teacher_id,email) 
  VALUES (1,'x@gmail.com');


SELECT * FROM Teacher_Email;



-- create teacher_contact table


CREATE TABLE Teacher_Contact (
  teacher_id INTEGER PRIMARY KEY,
  contact INTEGER
);


INSERT INTO Teacher_Contact (teacher_id,contact) 
  VALUES (1,01111345683);


SELECT * FROM Teacher_Contact;




-- create course table
CREATE TABLE Course (
  course_id TEXT PRIMARY KEY,
  dept_id TEXT NOT NULL,
  name TEXT NOT NULL,
  credit FLOAT NOT NULL,
  semester INTEGER NOT NULL
);


INSERT INTO Course (course_id,dept_id,name,credit,semester) 
  VALUES ('CSE121', 'CSE', 'Data Structure',3.0,11);


SELECT * FROM Course;








-- create section table
CREATE TABLE Section (
  section_id TEXT PRIMARY KEY,
  course_id TEXT NOT NULL,
  teacher_id INTEGER NOT NULL,
  year INTEGER NOT NULL
);


INSERT INTO Section (section_id,course_id,teacher_id,year) 
  VALUES ('CSE121-2022','CSE121',1,2022);


SELECT * FROM Section;








-- create course_enrollment table
CREATE TABLE Course_Enrollment (
  section_id INTEGER,
  reg_no INTEGER NOT NULL,
  grade FLOAT
);


INSERT INTO Course_Enrollment (section_id,reg_no,grade) 
  VALUES (1, 2018331054, 3.75);
INSERT INTO Course_Enrollment (section_id,reg_no) 
  VALUES (1, 2018331002);

SELECT * FROM Course_Enrollment;






-- create department table
CREATE TABLE Department (
  dept_id TEXT PRIMARY KEY,
  name TEXT NOT NULL
);


INSERT INTO Department (dept_id,name) 
  VALUES ('CSE','Computer Science and Engineering');

SELECT * FROM Department;





-- create head_of_department table
CREATE TABLE Head_of_Department (
  dept_id TEXT PRIMARY KEY,
  teacher_id INTEGER,
  joining_date DATE NOT NULL DEFAULT CURRENT_DATE,
  finishing_date DATE
);


INSERT INTO Head_of_Department (dept_id,teacher_id) 
  VALUES ('CSE',1);

SELECT * FROM Head_of_Department;





-- create classroom table
CREATE TABLE Classroom (
  classroom_id TEXT PRIMARY KEY,
  dept_id TEXT NOT NULL,
  room_num INTEGER NOT NULL,
  building TEXT NOT NULL  
);


INSERT INTO Classroom (classroom_id,dept_id,room_num,building) 
  VALUES ('IICT333','CSE',333,'IICT');

SELECT * FROM Classroom;






-- create time_slot table
CREATE TABLE Time_Slot (
  date DATE NOT NULL DEFAULT CURRENT_DATE PRIMARY KEY,
  section_id INTEGER NOT NULL,
  classroom_id INTEGER NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);


INSERT INTO Time_Slot (section_id,classroom_id,start_time,end_time) 
  VALUES (1,1,'06:05','07:05');

SELECT * FROM Time_Slot;







