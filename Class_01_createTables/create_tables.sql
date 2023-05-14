-- *** STUDENT TABLE ***
CREATE TABLE Student(
ID INTEGER PRIMARY KEY NOT NULL,
FirstName varchar(20) NOT NULL ,
LastName varchar (30) NOT NULL,
DateOfBirth date NOT NULL,
EnrolledDate varchar(20) NOT NULL,
Gender nchar(1) NOT NULL,
NationalIDNumber varchar(20) NOT NULL,
StudentCardNumber Integer NOT NULL
);

SELECT * FROM Student;

-- *** TEACHER TABLE ***
CREATE TABLE Teacher(
ID INTEGER PRIMARY KEY NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
DateOfBirth date NOT NULL,
AcademicRank varchar(20) NOT NULL,
HireDate date NOT NULL
);

-- not preffered way to select everything from a table
SELECT * FROM Teacher;

-- better way to select a table by column names
SELECT ID, FirstName,LastName,DateOfBirth,AcademicRank,HireDate FROM Teacher;

-- *** GradeDetails ***
CREATE TABLE GradeDetails (
ID INTEGER PRIMARY KEY NOT NULL,
GradeID Integer NOT NULL,
AchievementTypeID Integer NOT NULL,
AchievementPoints Integer NOT NULL,
AchievementMaxPoints Integer NOT NULL,
AchievementDate date NOT NULL
);

SELECT ID,GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate FROM GradeDetails;

-- *** Course ***
CREATE TABLE Course (
ID INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Credit Integer NOT NULL,
AcademicYear Integer NOT NULL,
Semester Integer NOT NULL
)

SELECT ID,Name,Credit,AcademicYear,Semester FROM Course;

-- *** Grade ***
CREATE TABLE Grade (
ID INTEGER PRIMARY KEY NOT NULL,
StudentID Integer NOT NULL,
CourseID Integer NOT NULL,
TeacherID Integer NOT NULL,
Grade smallint NOT NULL,
Comment varchar(100) NOT NULL,
CreatedDate date NOT NULL
)

SELECT ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate FROM Grade;

-- *** AchievementType ***
CREATE TABLE AchievementType (
ID INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Description varchar(75) NOT NULL,
ParticipationRate varchar(2) NOT NULL
);

SELECT ID,Name,Description, ParticipationRate FROM AchievementType;