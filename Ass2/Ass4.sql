--Retrieve the name of the students whose name starts with ‘S’ and contains ‘r’ as the second last character
SELECT
  name,
  RIGHT(name, 2)
FROM
  students
WHERE
  RIGHT(name, 2) LIKE 'r_'
  AND name LIKE 'S%';

-- Retrieve the name of the youngest student(s) from the ‘CST’ department along with the total marks obtained by him (them).
SELECT
  name,
  SUM(marks)
FROM
  students,
  crs_regd
WHERE
  rollno = crs_regd.crs_rollno
  AND deptcode = 'CSE'
  AND bdate = (
    SELECT
      MAX(bdate)
    FROM
      students
    WHERE
      deptcode = 'CSE'
  )
GROUP BY
  rollno;

-- Find the age of all the students
SELECT
  name,
  DATE_PART('year', AGE(bdate)) AS age
FROM
  students;
