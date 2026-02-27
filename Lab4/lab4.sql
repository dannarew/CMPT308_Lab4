-- Name: Daniel Narewski
-- Date: February 26, 2026
-- Data Status: Reused existing data / Reloaded from scripts

--Inner Join (2)
SELECT s.name, e.course_id
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.term = '2026SP';

--Inner Join (3)
SELECT 
    s.name, 
    c.title, 
    e.term
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c     ON e.course_id = c.course_id
WHERE e.term = '2026SP';

--Left Join
SELECT c.course_id, c.title, COUNT(e.student_id) AS enrollments
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id AND e.term = '2026SP'
GROUP BY c.course_id, c.title;

--Count per group (Students per Major)
SELECT major, COUNT(*) AS num_students
FROM Students
GROUP BY major
ORDER BY num_students DESC;

--Join + GROUP BY (Enrollments per Course Title)
SELECT c.course_id, c.title, COUNT(e.student_id) AS num_enrollments
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.term = '2026SP'
GROUP BY c.course_id, c.title;

--HAVING (Filter the Groups)
SELECT course_id, COUNT(student_id) AS num_enrollments
FROM Enrollments
WHERE term = '2026SP'
GROUP BY course_id
HAVING COUNT(student_id) >= 1;

--IN Subquery (Nested List)
SELECT name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id = 'CMPT308' AND term = '2026SP'
);

--EXISTS Subquery (Boolean Check)
SELECT course_id, title
FROM Courses c
WHERE EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.course_id = c.course_id AND e.term = '2026SP'
);

--Correlated Subquery / GROUP BY (Frequent Enrollers)
SELECT s.name
FROM Students s
WHERE (
    SELECT COUNT(*)
    FROM Enrollments e
    WHERE e.student_id = s.student_id AND e.term = '2026SP'
) >= 2;

--UNION (The "OR" Operation)
SELECT student_id, name
FROM Students
WHERE major = 'CS'

UNION

SELECT student_id, name
FROM Students
WHERE major = 'DS';

--EXCEPT (The "Subtraction" Operation)
SELECT student_id, name
FROM Students
WHERE major = 'CS'

EXCEPT

SELECT s.student_id, s.name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 'CMPT308' AND e.term = '2026SP';

