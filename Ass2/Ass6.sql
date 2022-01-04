SELECT
  deptname,
  MAX(parent_inc)
FROM
  students,
  depts
WHERE
  students.deptcode = depts.deptcode
  AND parent_inc < 9000000
  AND students.deptcode != 'MEC'
GROUP BY
  depts.deptcode;

-- Retrieve the fifth highest parent income for hostel number 5.
SELECT
  DISTINCT parent_inc
FROM
  students
WHERE
  hostel = '5'
ORDER BY
  parent_inc DESC
LIMIT
  1 OFFSET 4;

-- Find the roll number of the students from each department who obtained highest total marks in their own department.
SELECT
  rollno,
  deptcode
FROM
  students
  INNER JOIN (
    SELECT
      crs_rollno,
      SUM(marks) AS total
    FROM
      crs_regd
    GROUP BY
      crs_rollno
  ) t ON students.rollno = t.crs_rollno
WHERE
  (deptcode, total) IN (
    SELECT
      deptcode,
      MAX(total) AS maxmarks
    FROM
      students
      INNER JOIN (
        SELECT
          crs_rollno,
          SUM(marks) AS total
        FROM
          crs_regd
        GROUP BY
          crs_rollno
      ) s ON students.rollno = s.crs_rollno
    GROUP BY
      deptcode
  );
