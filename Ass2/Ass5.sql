-- Retrieve the name of the student(s) who obtained SECOND highest marks IN ‘ DBMS ’.
SELECT
  name,
  marks
FROM
  students,
  crs_regd
WHERE
  rollno = crs_rollno
  AND crs_cd = 'ETC_1'
  AND marks = (
    SELECT
      marks
    FROM
      crs_regd
    WHERE
      crs_cd = 'ETC_1'
    ORDER BY
      marks DESC OFFSET 1
    LIMIT
      1
  );

-- Find out the differences between highest and lowest marks obtained in each subject.
SELECT
  crs_cd,
  MAX(marks) - MIN(marks) AS diff
FROM
  crs_regd
GROUP BY
  crs_cd;

--- Assuming the existance of several interdepartmental courses, retrieve the name of the student(s) who is(are) studing under at least one faculty from each department.
SELECT
  rollno,
  name
FROM
  students,
  crs_regd,
  crs_offrd,
  faculty
WHERE
  rollno = crs_rollno
  AND crs_cd = crs_code
  AND crs_fac_cd = fac_code
GROUP BY
  rollno,
  name
HAVING
  COUNT(DISTINCT fac_dept) = (
    SELECT
      COUNT(*)
    FROM
      depts
  );

-- Assuming the existance of several interdepartmental courses, retrieve the name of the student(s) who is(are) studing under the faculties only from his(their) own department.
SELECT
  rollno,
  name
FROM
  students
WHERE
  rollno NOT IN (
    SELECT
      rollno
    FROM
      students,
      crs_regd,
      crs_offrd,
      faculty
    WHERE
      rollno = crs_rollno
      AND crs_code = crs_cd
      AND fac_code = crs_fac_cd
      AND deptcode != fac_dept
  )
GROUP BY
  rollno,
  name;
