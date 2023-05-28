--- *** PRE REQUIERIES ***
--ALTER TABLES TO MAKE RELATIONS...

-- GRADE TABLE
ALTER TABLE grade
ADD CONSTRAINT grade_studentid_fkey FOREIGN KEY (studentid) REFERENCES student(id);

ALTER TABLE grade
ADD CONSTRAINT grade_courseid_fkey FOREIGN KEY (courseid) REFERENCES course(id);

ALTER TABLE grade 
ADD CONSTRAINT grade_teacherid_fkey FOREIGN KEY (teacherid) REFERENCES teacher(id);


select * from gradedetails;
--GRADEDETAILS TABLE
ALTER TABLE gradedetails
ADD CONSTRAINT gradedetails_achivementtype_fkey FOREIGN KEY (achievementtypeid) REFERENCES achievementtype(id);