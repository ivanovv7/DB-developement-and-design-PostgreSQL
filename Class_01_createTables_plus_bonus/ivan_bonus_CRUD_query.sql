--                                  ****** IVAN BONUS EXERCISE ****** --


-- INSERT DATA SINGLE WRITE SYNTAX AND MULTIPLE WRITE SYNTAX

-- SINGLE WRITE -> OK
INSERT INTO grade(ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
VALUES (1,8989,25,2,10,'He/she is very goog student','14-05-2023');

--READ AFTER WRITE
SELECT ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate FROM Grade;

-- MULTIPLE WRITE
INSERT INTO grade(ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
VALUES 
(2,2369,14,1,9,'Very big potential', '14-05-2023'),
(3,2566,56,5,7,'Need to work more !', '14-05-2023');

--READ AFTER WRITE --> OK
SELECT ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate FROM Grade;


-- UPDATE 

UPDATE grade
SET Grade = 8, teacherID = 1
WHERE ID = 1;

--READ AFTER UPDATE --> OK
SELECT ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate FROM Grade;



--DELETE

-- SINGLE ROW DELETE
DELETE FROM grade
WHERE id = 1;

-- MULTIPLE ROW DELETE with keyword "IN" but without "=" sign
DELETE FROM grade
WHERE ID IN (2,3)

--READ AFTER DELETING EVERYTHING --> TABLE IS EMPTY -> OKK :D
SELECT ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate FROM Grade;
