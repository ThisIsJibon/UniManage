--schema definition


CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username INTEGER NOT NULL UNIQUE,
    passhash VARCHAR NOT NULL
);


CREATE TABLE Student (
  reg_no INTEGER PRIMARY KEY,
  name TEXT,
  dept_id TEXT,
  session INTEGER,
  address TEXT
);


CREATE TABLE Student_Email (
  reg_no INTEGER PRIMARY KEY,
  email TEXT
);


CREATE TABLE Student_Contact (
  reg_no INTEGER PRIMARY KEY,
  contact INTEGER
);


CREATE TABLE Teacher (
  teacher_id SERIAL PRIMARY KEY,
  name TEXT,
  dept_id TEXT NOT NULL,
  designation TEXT NOT NULL
);


CREATE TABLE Teacher_Email (
  teacher_id INTEGER PRIMARY KEY,
  email TEXT
);


CREATE TABLE Teacher_Contact (
  teacher_id INTEGER PRIMARY KEY,
  contact INTEGER
);


CREATE TABLE Course (
  course_id TEXT PRIMARY KEY,
  dept_id TEXT NOT NULL,
  name TEXT NOT NULL,
  credit FLOAT NOT NULL,
  type TEXT NOT NULL
);


CREATE TABLE Section (
  id SERIAL PRIMARY KEY,
  section_id TEXT NOT NULL,
  course_id TEXT NOT NULL,
  teacher_id INTEGER NOT NULL,
  semester INTEGER NOT NULL,
  year INTEGER NOT NULL,
  phase INTEGER NOT NULL
);


CREATE TABLE Course_Enrollment (
  id SERIAL,
  section_id TEXT NOT NULL,
  course_id TEXT NOT NULL,
  reg_no INTEGER NOT NULL,
  grade FLOAT
);


CREATE TABLE Department (
  dept_id TEXT PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE Head_of_Department (
  dept_id TEXT PRIMARY KEY,
  teacher_id INTEGER,
  joining_date DATE NOT NULL DEFAULT CURRENT_DATE,
  finishing_date DATE
);


CREATE TABLE Classroom (
  classroom_id TEXT PRIMARY KEY,
  dept_id TEXT NOT NULL,
  room_num INTEGER NOT NULL,
  building TEXT NOT NULL  
);


CREATE TABLE Time_Slot (
  time_slot_id SERIAL PRIMARY KEY,
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  course_id TEXT NOT NULL,
  section_id TEXT NOT NULL,
  classroom_id TEXT NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);



--dummy data

INSERT INTO Student (reg_no,name,dept_id,session,address) 
  VALUES (2018331002,'Mehedi Hasan', 'CSE', 2018,'Sylhet');

SELECT * FROM Student;



INSERT INTO Student_Email (reg_no,email) 
  VALUES (2018331002,'jibon@gmail.com');

SELECT * FROM Student_Email;



INSERT INTO Student_Contact (reg_no,contact) 
  VALUES (2018331002,01706323578);

SELECT * FROM Student_Contact;




INSERT INTO Teacher (teacher_id,name,dept_id,designation) 
  VALUES (1,'Sakib Khan', 'CSE','Lecturer');

INSERT INTO Teacher VALUES (2,'Ananta Jalil','CSE','Lecturer');
INSERT INTO Teacher VALUES (3,'Hero Alam','CSE','Professor');
INSERT INTO Teacher VALUES (4,'Alfeh Sani','PHY','Lecturer');
INSERT INTO Teacher VALUES (5,'Joshim','BBA','Lecturer');
INSERT INTO Teacher VALUES (6,'Omor Sani','IPE','Lecturer');

SELECT * FROM Teacher;



INSERT INTO Teacher_Email (teacher_id,email) 
  VALUES (1,'ab@gmail.com');


SELECT * FROM Teacher_Email;



INSERT INTO Teacher_Contact (teacher_id,contact) 
  VALUES (1,01111345683);

SELECT * FROM Teacher_Contact;


INSERT INTO Course (course_id,dept_id,name,credit,type) 
  VALUES ('CSE121', 'CSE', 'Data Structure',3.0,'theory');

INSERT INTO Course VALUES('CSE150','CSE','Competitive Programming',1.5,'lab');
INSERT INTO Course VALUES('CSE250','CSE','Project Work',1.5,'lab');
INSERT INTO Course VALUES('IPE150','IPE','IPE Workshop',1.0,'theory');
INSERT INTO Course VALUES('IPE220','IPE','IPE Graphics',2.0,'lab');
INSERT INTO Course VALUES('CSE333','CSE','Database Systems',3.00,'theory');
INSERT INTO Course VALUES('CSE327','CSE','Database Systems Lab',2.00,'lab');
INSERT INTO Course VALUES('CSE328','CSE','Operating Systems',1.5,'theory');
INSERT INTO Course VALUES('CSE329','CSE','Operating Systems Lab',1.5,'lab');
INSERT INTO Course VALUES('CSE233','CSE','Data Structures',3.00,'theory');
INSERT INTO Course VALUES('CSE234','CSE','Data Structures Lab',2.00,'lab');
INSERT INTO Course VALUES('CSE242','CSE','Numerical Analysis',3.00,'theory');
INSERT INTO Course VALUES('CSE243','CSE','Numerical Analysis Lab',1.00,'lab');
INSERT INTO Course VALUES('BUS201D','BBA','Accounting and Finance',3.00,'theory');
INSERT INTO Course VALUES('ECO203D','ECO','Basic Economics',3.00,'theory');
INSERT INTO Course VALUES('PHY107D','PHY','Linear Optics',3.00,'theory');


SELECT * FROM Course;


INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) 
  VALUES ('2022-1','CSE121',1,1,2022,1);

INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CSE328',2,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','BUS201D',5,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-1','PHY107D',4,3,2023,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-1','CSE328',2,1,2023,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-2','BUS201D',5,2,2023,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-2','IPE150',6,2,2023,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','IPE150',1,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','IPE120',6,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','EEE150',1,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','EEE120',6,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','IPE170',1,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','IPE180',6,2,2022,2);

INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CEE141',1,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','CEE144',1,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','MAT101',1,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CSE329',5,1,2022,1);

INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','ECO203D',3,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','CSE233',1,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2021-1','CSE233',1,2,2021,1);


SELECT * FROM Section;


-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) 
--   VALUES (1, 2018331002,5.00);

-- --5.00 is invalid grade

-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('CSE328-2022', 2018331002,4.00);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('CSE328-2022', 2018331001,1.50);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('CSE328-2022', 2018331003,3.75);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('CSE328-2022', 2018331054,4.00);

-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('PHY107D-2020', 2018331002,3.75);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('PHY107D-2020', 2018331001,2.00);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('PHY107D-2020', 2018331003,2.75);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('PHY107D-2020', 2018331054,3.50);

-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('IPE150-2021', 2018331002,2.00);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('IPE150-2021', 2018331001,3.00);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('IPE150-2021', 2018331003,3.25);
-- INSERT INTO Course_Enrollment (section_id,reg_no,grade) VALUES ('IPE150-2021', 2018331054,5.00);

INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-2', 2018331002,2.50,'BUS201D');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-2', 2018331001,3.25,'BUS201D');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-2', 2018331003,3.75,'BUS201D');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-2', 2018331054,3.00,'BUS201D');

INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,0.00,'CSE121');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,0.00,'CSE328');

INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,3.50,'CSE233');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,2.00,'CSE329');

INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,4.00,'ECO203D');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,0.00,'MAT101');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-2', 2018331002,0.00,'CEE144');
INSERT INTO Course_Enrollment (section_id,reg_no,grade,course_id) VALUES ('2022-1', 2018331002,2.00,'CEE141');
-- SELECT * FROM Course_Enrollment;



INSERT INTO Department (dept_id,name) 
  VALUES ('CSE','Computer Science and Engineering');

INSERT INTO Department VALUES('IPE','Industrial Production and Engineering');
INSERT INTO Department VALUES('ECO','Economics');
INSERT INTO Department VALUES('BBA','Bachelors in Business Administration');
INSERT INTO Department VALUES('PHY','Physics');
INSERT INTO Department VALUES('MAT','Mathematics');

SELECT * FROM Department;



INSERT INTO Head_of_Department (dept_id,teacher_id) 
  VALUES ('CSE',1);

SELECT * FROM Head_of_Department;



INSERT INTO Classroom (classroom_id,dept_id,room_num,building) 
  VALUES ('333-A','CSE',333,'IICT');
INSERT INTO Classroom VALUES ('333-A','PHY',333,'A');
INSERT INTO Classroom VALUES ('104-D','BUS',104,'D');
INSERT INTO Classroom VALUES ('201-E','IPE',201,'E');
INSERT INTO Classroom VALUES ('433-IICT','EEE',433,'IICT');

SELECT * FROM Classroom;



INSERT INTO Time_Slot (section_id,course_id,classroom_id,start_time,end_time) 
  VALUES ('2022-1','CSE121','333-A','11:05','12:05');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','CSE328','104-D','13:05','14:05');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','BUS201D','201-E','15:05','16:05');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-2','BUS201D','201-E','13:05','14:05');

INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','CEE144','201-E','12:05','16:05');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','CEE329','104-D','12:45','13:25');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','CEE233','Gallery-2-IICT','10:05','11:35');



SELECT * FROM Time_Slot;


--JOINS

-- results


select
  * 
from student s
  inner join course_enrollment e using (reg_no) 
  inner join section se using (section_id) 
  inner join course c using (course_id)
order by s.reg_no;


-- get schedules for logged in user [grade 0.00 in course enrollment means ongoing course]

select 
  *
from course_enrollment 
inner join time_slot using(section_id)
where reg_no = user.reg_no and grade = 0;


----course registration page populate
SELECT * 
FROM course JOIN section USING(course_id)
WHERE section_id = "2022-1" and semester = 1;

-- result page populate
SELECT course_id,name,semester,credit,grade FROM 
  section JOIN course_enrollment USING(section_id,course_id)
  JOIN course  USING (course_id);



-- LEGIT DUMMY DATA

INSERT INTO Department (dept_id,name) 
  VALUES ('CSE','Computer Science and Engineering');

INSERT INTO Department VALUES('IPE','Industrial Production and Engineering');
INSERT INTO Department VALUES('ECO','Economics');
INSERT INTO Department VALUES('BBA','Bachelors in Business Administration');
INSERT INTO Department VALUES('PHY','Physics');
INSERT INTO Department VALUES('MAT','Mathematics');
INSERT INTO Department VALUES('CEE','Civil and Environmental Engineering');
INSERT INTO Department VALUES('ENG','English');
INSERT INTO Department VALUES('SWE','Software Engineering');
INSERT INTO Department VALUES('EEE','Electrical Engineering');




INSERT INTO Student (reg_no,name,dept_id,session,address) 
  VALUES (2018331002,'Mehedi Hasan', 'CSE', 2018,'Sylhet');

INSERT INTO Student VALUES (2018331003,'Shahrab Khan', 'CSE', 2018,'Sylhet');
INSERT INTO Student VALUES (2018331004,'Ameya Khan', 'CSE', 2018,'Sylhet');
INSERT INTO Student VALUES (20183310010,'Kowshiq', 'CSE', 2018,'Sylhet');
INSERT INTO Student VALUES (2018331054,'Mahinur Alam', 'CSE', 2018,'Sylhet');
INSERT INTO Student VALUES (2018331068,'Sohan', 'CSE', 2018,'Sylhet');
INSERT INTO Student VALUES (2018831003,'Mahin Khan', 'SWE', 2018,'Sylhet');
INSERT INTO Student VALUES (2018231003,'Karim Benzema', 'ENG', 2018,'Sylhet');

INSERT INTO Teacher (teacher_id,name,dept_id,designation) 
  VALUES (1,'Sakib Khan', 'CSE','Lecturer');

INSERT INTO Teacher VALUES (2,'Ananta Jalil','CSE','Lecturer');
INSERT INTO Teacher VALUES (3,'Hero Alam','CSE','Professor');
INSERT INTO Teacher VALUES (4,'Alfeh Sani','PHY','Lecturer');
INSERT INTO Teacher VALUES (5,'Joshim','BBA','Lecturer');
INSERT INTO Teacher VALUES (6,'Omor Sani','IPE','Lecturer');


INSERT INTO Course (course_id,dept_id,name,credit,type) 
  VALUES ('CSE121', 'CSE', 'Data Structure',3.0,'theory');

INSERT INTO Course VALUES('CSE150','CSE','Competitive Programming',1.5,'lab');
INSERT INTO Course VALUES('CSE250','CSE','Project Work',1.5,'lab');
INSERT INTO Course VALUES('CSE333','CSE','Database Systems',3.00,'theory');
INSERT INTO Course VALUES('CSE334','CSE','Database Systems Lab',2.00,'lab');
INSERT INTO Course VALUES('CSE328','CSE','Operating Systems',1.5,'theory');
INSERT INTO Course VALUES('CSE329','CSE','Operating Systems Lab',1.5,'lab');
INSERT INTO Course VALUES('CSE233','CSE','Data Structures',3.00,'theory');
INSERT INTO Course VALUES('CSE234','CSE','Data Structures Lab',2.00,'lab');
INSERT INTO Course VALUES('CSE242','CSE','Numerical Analysis',3.00,'theory');
INSERT INTO Course VALUES('CSE243','CSE','Numerical Analysis Lab',1.00,'lab');
INSERT INTO Course VALUES('IPE150','IPE','IPE Workshop',1.0,'theory');
INSERT INTO Course VALUES('IPE220','IPE','IPE Graphics',2.0,'lab');
INSERT INTO Course VALUES('BUS201D','BBA','Accounting and Finance',3.00,'theory');
INSERT INTO Course VALUES('ECO203D','ECO','Basic Economics',3.00,'theory');
INSERT INTO Course VALUES('ECO303D','ECO','Advanced Economics',3.00,'theory');
INSERT INTO Course VALUES('PHY107D','PHY','Linear Optics',3.00,'theory');
INSERT INTO Course VALUES('PHY207D','PHY','Thermodynamics',3.00,'theory');
INSERT INTO Course VALUES('PHY307D','PHY','Quantam Mechanics',3.00,'theory');
INSERT INTO Course VALUES('CEE104','CEE','Environmental Engineering',2.00,'theory');
INSERT INTO Course VALUES('CEE105','CEE','Environmental Engineering Lab',1.00,'lab');
INSERT INTO Course VALUES('MAT150','MAT','Calculus',2.00,'theory');
INSERT INTO Course VALUES('MAT152','MAT','Calculus Lab',2.00,'lab');
INSERT INTO Course VALUES('MAT154','MAT','Trigonometry',2.00,'lab');
INSERT INTO Course VALUES('MAT252','MAT','Laplace Transform',2.00,'theory');
INSERT INTO Course VALUES('MAT254','MAT','Fourier Analysis',3.00,'theory');
INSERT INTO Course VALUES('SWE120','SWE','Basics of Software Engineering',1.00,'theory');
INSERT INTO Course VALUES('SWE125','SWE','Software Project Management',1.00,'theory');
INSERT INTO Course VALUES('SWE232','SWE','Ethics in Software Engineering',1.50,'theory');
INSERT INTO Course VALUES('SWE240','SWE','Cyber Law in Software Engineering',1.50,'theory');
INSERT INTO Course VALUES('EEE105','EEE','Circuit Analysis',1.50,'theory');
INSERT INTO Course VALUES('EEE106','EEE','Circuit Analysis Lab',2.50,'lab');
INSERT INTO Course VALUES('EEE208','EEE','Digital Logic Design',1.50,'theory');
INSERT INTO Course VALUES('EEE210','EEE','Digital Electronics',1.50,'lab');
INSERT INTO Course VALUES('ENG101','ENG','English Literature',1.50,'theory');
INSERT INTO Course VALUES('ENG110','ENG','English in Communications',1.50,'lab');
INSERT INTO Course VALUES('ENG210','ENG','Advanced English Literature',1.50,'lab');
INSERT INTO Course VALUES('CEE210','CEE','Envrionmental Science',1.50,'lab');
INSERT INTO Course VALUES('CEE220','CEE','Energy and Power',1.50,'lab');





INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CSE121',2,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','CSE150',5,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-1','CSE250',4,3,2023,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-2','CSE333',2,4,2023,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','CSE334',5,6,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','CSE328',6,6,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CSE329',1,5,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','IPE220',6,3,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-1','IPE150',1,1,2023,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-2','ECO203D',6,4,2023,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-1','PHY107D',1,1,2023,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2023-2','PHY207D',6,4,2023,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2024-1','PHY307D',1,5,2024,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2024-2','CEE104',1,2,2024,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2024-1','CEE105',1,1,2024,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2024-1','MAT150',5,1,2024,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2025-2','CSE242',1,4,2025,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','CSE243',1,3,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','MAT152',2,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','MAT154',5,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','MAT252',2,3,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','MAT254',5,4,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','SWE120',2,1,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','SWE125',5,2,2022,2);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-1','SWE232',2,3,2022,1);
INSERT INTO Section (section_id,course_id,teacher_id,semester,year,phase) VALUES ('2022-2','SWE240',5,4,2022,2);


INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','CSE121', 2018331002,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','CSE150', 2018331002,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','CSE250', 2018331002,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','CSE333', 2018331002,4.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','IPE220', 2018331002,3.75);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','IPE150', 2018331002,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','ECO203D', 2018331002,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','PHY107D', 2018331002,0.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','PHY207D', 2018331002,3.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','MAT152', 2018331002,0.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','MAT154', 2018331002,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','SWE120', 2018331002,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','SWE125', 2018331002,3.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','SWE232', 2018331002,3.75);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','SWE240', 2018331002,4.00);

INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','CSE121', 2018331054,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','CSE150', 2018331054,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','CSE250', 2018331054,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','CSE333', 2018331054,4.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','IPE220', 2018331054,3.75);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','IPE150', 2018331054,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','ECO203D', 2018331054,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-1','PHY107D', 2018331054,0.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2023-2','PHY207D', 2018331054,3.25);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','MAT152', 2018331003,0.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','MAT154', 2018331003,3.50);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','SWE120', 2018331003,0.0);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','SWE125', 2018331003,3.75);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-1','SWE232', 2018331003,4.00);
INSERT INTO Course_Enrollment (section_id,course_id,reg_no,grade) VALUES ('2022-2','SWE240', 2018331003,4.00);

INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','CSE121','302-IICT','10:00','11:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','CSE150','312-IICT','12:00','14:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-1','CSE250','102-IICT','12:00','14:30');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-2','CSE333','123-IICT','09:00','11:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','IPE220', '201-E','09:30','11:30');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-1','IPE150', '220-E','12:30','13:30');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-2','ECO203D','102-A','09:00','11:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2023-1','PHY107D', '132-B','14:00','15:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','MAT152','102-C','10:00','12:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','MAT154','122-C','12:00','15:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','SWE120', '102-IICT','10:00','11:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','SWE125','102-IICT','10:00','12:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-1','SWE232' ,'302-IICT','11:00','12:00');
INSERT INTO Time_Slot(section_id,course_id,classroom_id,start_time,end_time)  VALUES ('2022-2','SWE240','201-IICT','13:00','14:00');



INSERT INTO Classroom VALUES ('102-A','ECO',102,'A');
INSERT INTO Classroom VALUES ('102-C','MAT',102,'C');
INSERT INTO Classroom VALUES ('312-IICT','CSE',312,'IICT');
INSERT INTO Classroom VALUES ('102-IICT','SWE',102,'IICT');
INSERT INTO Classroom VALUES ('132-B','PHY',132,'PHY');