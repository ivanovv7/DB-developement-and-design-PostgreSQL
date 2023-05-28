--                                *** ***    1/3   *** ***

-- 1. Calculate the count of all grades in the system
SELECT * FROM grade;
SELECT COUNT(grade) as Total_Grades FROM grade;

-- 2. Calculate the count of all grades per Teacher in the system

-- displayed by teacher but only with the teacher id
SELECT teacherid, COUNT(grade) FROM GRADE
GROUP BY teacherid -- BONUS

-- SAME but now we have the name of the teacher - OK
SELECT teacher.id,teacher.firstname, COUNT(grade) FROM GRADE
INNER JOIN teacher ON GRADE.teacherid = teacher.id
GROUP BY teacher.id
ORDER BY teacher.id DESC; -- BONUS

-- 3. Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 30)
  -- same query as above (2.) but i have added filter "WHERE"

SELECT teacher.id,teacher.firstname, COUNT(grade) FROM GRADE
INNER JOIN teacher ON GRADE.teacherid = teacher.id
WHERE grade.studentid <= 30
GROUP BY teacher.id
ORDER BY teacher.id DESC -- BONUS

-- 4. Find the Maximal Grade, and the Average Grade per Student on all grades in the system

-- WITHOUT INNER JOIN DISPLAYING ONLY STUNDETS IDs
SELECT studentid, MAX(grade), AVG(grade) FROM grade
GROUP BY studentid
ORDER BY studentid ASC -- BONUS

-- WITH INNER JOIN DISPLAYING STUDENTS NAMES  ! OK
SELECT s.firstname, MAX(g.grade) as Max_grade, AVG(g.grade) as Avg_grade FROM grade AS g
INNER JOIN student as s ON g.studentid = s.id
GROUP BY s.firstname
ORDER BY AVG(g.grade) ASC -- BONUS


--                                *** ***    2/3   *** ***

-- 1. Calculate the count of all grades per Teacher in the system and filter only grade count greater then 3

SELECT  t.firstname, COUNT(g.grade) FROM grade as g
INNER JOIN teacher as t ON t.id = g.teacherid
GROUP BY t.firstname
HAVING COUNT(g.grade) > 3


-- 2.Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
SELECT  t.firstname, COUNT(g.grade) FROM grade as g
INNER JOIN teacher as t ON t.id = g.teacherid
WHERE g.studentid < 30
GROUP BY t.firstname
HAVING COUNT(g.grade) > 3;

-- 3. Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT 
studentid, COUNT(grade) as Count_grade, MAX(grade) as Max_Grade, AVG(grade) as Avg_grade 
FROM grade
GROUP BY studentid
HAVING MAX(grade) = AVG(grade);

-- 4. List Student First Name and Last Name next to the other details from previous query
SELECT 
g.studentid,s.firstname,s.lastname, COUNT(g.grade) as Count_grade, MAX(g.grade) as Max_Grade, AVG(g.grade) as Avg_grade 
FROM grade as g
INNER JOIN student as s ON s.id = g.studentid
GROUP BY g.studentid, s.firstname, s.lastname
HAVING MAX(grade) = AVG(grade);



--                                *** ***    3/3   *** ***


-- 1. Create new view (vw_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vw_StudentGrades AS
 SELECT grade.studentid,
    count(grade.grade) AS count
   FROM grade
  GROUP BY grade.studentid;

-- 2. Change the view to show Student First and Last Names instead of StudentID
CREATE OR REPLACE VIEW vw_StudentGrades AS
SELECT s.firstname, s.lastname, COUNT(g.grade),g.studentid
FROM grade as g
INNER JOIN student as s 
ON s.id = g.studentid
GROUP BY  s.firstname,s.lastname, g.studentid;

SELECT * FROM vw_StudentGrades;

-- 3. List all rows from view ordered by biggest Grade Count
SELECT * FROM vw_StudentGrades
ORDER BY count desc;

-- 4. Create new view (vw_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam
CREATE  OR REPLACE VIEW vw_StudentGradeDetails AS
SELECT s.firstname, s.lastname, COUNT(g.courseid)
FROM student as s
INNER JOIN grade as g
ON g.studentid = s.id
WHERE g.grade >= 8 -- students with grade above 6 have passed
GROUP BY s.id;

-- TESTING
SELECT * FROM vw_StudentGradeDetails;

SELECT * FROM grade
ORDER BY grade;

SELECT * FROM grade
ORDER BY studentid;