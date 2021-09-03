-- record that violates constraints
-- INSERT INTO
--   depts
-- VALUES
--   ('CSE', 'Computer Science');
-- INSERT INTO
--   depts
-- VALUES
--   ('ABC', NULL);
-- INSERT INTO
--   depts
-- VALUES
--   ('ABC', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
--
--
--Delete records from dept where deptcode='CSE'.
-- DELETE FROM
--   depts
-- WHERE
--   deptcode = 'CSE';
-- SELECT
--   *
-- FROM
--   depts;
-- SELECT
--   *
-- FROM
--   students;
--
--Find out the courses offered by the faculty dbp and nls.
SELECT
  crs_name,
  crs_fac_cd
FROM
  crs_offrd
WHERE
  crs_fac_cd = 'CSE_F1'
  OR crs_fac_cd = 'IT_F2';

--
-- Find out the courses with full details offered by dbp.
SELECT
  *
FROM
  crs_offrd
WHERE
  crs_fac_cd = 'CSE_F1';

--
-- Get the courses the credits of which lies between 4.0 and 6.0
SELECT
  *
FROM
  crs_offrd
WHERE
  crs_credits > 4.0
  AND crs_credits < 6.0;

--
-- Get the courses the credits of which are > 6.5.
SELECT
  *
FROM
  crs_offrd
WHERE
  crs_credits > 6.5;

--
-- Count the number of students in CSE dept.
SELECT
  COUNT(*)
FROM
  students
WHERE
  deptcode = 'CSE';

--
-- Determine the minimum, maximum and average marks of each courses.
SELECT
  crs_cd,
  crs_name,
  MIN(marks) AS min_marks,
  MAX(marks) AS max_marks,
  AVG(marks) AS avg_marks
FROM
  crs_regd,
  crs_offrd
WHERE
  crs_cd = crs_code
GROUP BY
  crs_cd,
  crs_name;

--
-- Determine the total credits of the courses registered by a student.
SELECT
  crs_rollno,
  SUM(crs_credits)
FROM
  crs_regd,
  crs_offrd
WHERE
  crs_cd = crs_code
GROUP BY
  crs_rollno;

--
-- Count the number of students in each hostel whose department is CSE.
SELECT
  hostel,
  COUNT(*)
FROM
  students
WHERE
  deptcode = 'CSE'
GROUP BY
  hostel;

--
-- Display the hostel,rollno,parent_inc of the student who has the max(parent_inc) in a hostel.
SELECT
  hostel,
  rollno,
  parent_inc
FROM
  students
  INNER JOIN (
    SELECT
      hostel,
      max(parent_inc) AS max_par_inc
    FROM
      students
    GROUP BY
      hostel
  ) AS d USING(hostel)
WHERE
  parent_inc = d.max_par_inc
GROUP BY
  hostel,
  rollno;

SELECT
  DISTINCT hostel,
  rollno,
  parent_inc
FROM
  students a
WHERE
  parent_inc = (
    SELECT
      max(parent_inc)
    FROM
      students b
    WHERE
      b.hostel = a.hostel
  );

-- Display the name and parental income of each student greater than the parental income of some rollno 92005010.
SELECT
  name,
  parent_inc
FROM
  students
WHERE
  parent_inc > (
    SELECT
      parent_inc
    FROM
      students
    WHERE
      rollno = 51054427
  )
ORDER BY
  parent_inc;

--
-- Find out marks of students who have marks more than rollno 51052985 for course ETC_1 and MEC_4.
SELECT
  *
FROM
  crs_regd
WHERE
  marks > (
    SELECT
      marks
    FROM
      crs_regd
    WHERE
      crs_rollno = 51052985
      AND crs_cd = 'ETC_1'
  )
  AND crs_cd = 'ETC_1'
UNION
SELECT
  *
FROM
  crs_regd
WHERE
  marks > (
    SELECT
      marks
    FROM
      crs_regd
    WHERE
      crs_rollno = 51052985
      AND crs_cd = 'MEC_4'
  )
  AND crs_cd = 'MEC_4';

--
-- List students (rollno,name,deptcode) registered for course EE101.
SELECT
  rollno,
  name,
  deptcode
FROM
  students,
  crs_regd
WHERE
  rollno = crs_rollno
  AND crs_cd = 'ETC_1';

--
-- List students (rollno,name) in ELE dept registered for course EE101.
SELECT
  rollno,
  name,
  deptcode
FROM
  students,
  crs_regd
WHERE
  rollno = crs_rollno
  AND crs_cd = 'ETC_1'
  AND deptcode = 'ETC';

--
-- List students (rollno,name) in ELE dept not registered for course EE101.
SELECT
  rollno,
  name,
  deptcode
FROM
  students,
  crs_regd
WHERE
  rollno = crs_rollno
  AND crs_cd = 'ETC_1'
  AND NOT deptcode = 'ETC';

--
-- List the names of the students who have registered for both the courses 'CSE Course 2' and 'CSE Course 3'.
SELECT
  name
FROM
  students,
  crs_regd,
  crs_offrd
WHERE
  rollno = crs_rollno
  AND crs_cd = crs_code
  AND crs_name = 'ETC Course 2'
INTERSECT
SELECT
  name
FROM
  students,
  crs_regd,
  crs_offrd
WHERE
  rollno = crs_rollno
  AND crs_cd = crs_code
  AND crs_name = 'ETC Course 3';

--
-- Find the names of the faculty members who have offered either 'CSE Course 2' or 'CSE Course 3'
SELECT
  fac_name
FROM
  faculty,
  crs_offrd
WHERE
  fac_code = crs_fac_cd
  AND crs_name = 'CSE Course 2'
UNION
SELECT
  fac_name
FROM
  faculty,
  crs_offrd
WHERE
  fac_code = crs_fac_cd
  AND crs_name = 'CSE Course 3';

--
--Find the names of the faculty members who have offered 'CSE Course 2' but not offered 'CSE Course 3'
SELECT
  fac_name
FROM
  faculty,
  crs_offrd
WHERE
  fac_code = crs_fac_cd
  AND crs_name = 'CSE Course 2'
EXCEPT
SELECT
  fac_name
FROM
  faculty,
  crs_offrd
WHERE
  fac_code = crs_fac_cd
  AND crs_name = 'CSE Course 3';

--
-- Find out the students in each hostel who are not registered for any course.
SELECT
  hostel,
  count(*)
FROM
  students
WHERE
  rollno NOT IN (
    SELECT
      crs_rollno
    FROM
      crs_regd
  )
GROUP BY
  hostel;

--
-- Select the students who are in ELE dept or who have registered for course CS101.
SELECT
  *
FROM
  students
WHERE
  deptcode = 'ETC'
  OR rollno IN (
    SELECT
      crs_rollno
    FROM
      crs_regd
    WHERE
      crs_cd = 'CSE_1'
  );

--
-- Display the students who have registered to all the courses.
SELECT
  crs_rollno,
  name
FROM
  students,
  crs_regd
WHERE
  crs_rollno = rollno
GROUP BY
  crs_rollno,
  name
HAVING
  COUNT(*) = (
    SELECT
      COUNT(*)
    FROM
      crs_offrd
  );

--
-- Give Grace Marks 5 in subject CSE Course 1 to the students who have scored less than 80 in that subject.
UPDATE
  crs_regd
SET
  marks = marks + 5
FROM
  crs_offrd
WHERE
  crs_code = crs_cd
  AND crs_name = 'CSE Course 1'
  AND marks < 80;
