# 1.Query the existence of 1 course
select * from Course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id=1 or id=2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select student.id,student.name,avg(student_course.score) from student inner join student_course where student.id=student_course.studentId group by student.id having avg(student_course.score)>=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select distinct studentId from student_course);

# 5.Query all SQL with grades
select * from student inner join student_course on student_course.studentId=student.id inner join course on student_course.courseId=course.id;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student inner join student_course on student_course.studentId=student.id where id=1 and student_course.courseId=2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select score from student_course where score<60 order by score desc limit 1;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select student_course.courseId, course.name, avg(student_course.score) from course inner join student_course where course.id = student_course.courseId group by student_course.courseId order by avg(student_course.score) desc, student_course.courseId ASC

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name, course.name, student_course.score from student inner join course inner join student_course where student.id = student_course.studentId and student_course.courseId = course.id having course.name = "Math" and student_course.score < 60;