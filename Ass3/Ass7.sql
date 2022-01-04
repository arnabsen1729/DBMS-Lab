-- Create a view of all students in dept CSE.
CREATE VIEW CSE_students AS
SELECT
  *
FROM
  students
WHERE
  deptcode = 'CSE';

--Create a view named as cse_stud for ‘CSE’ dept students having attributes rollno, name, hostel
CREATE VIEW cse_stud AS
SELECT
  rollno,
  name,
  hostel
FROM
  students
WHERE
  deptcode = 'CSE';

-- Insert a new student of CSE. Analyse the result.
INSERT INTO
  cse_stud
VALUES
  ('51052987', 'Rashmi', '8');

-- Increment parental income by Rs. 5000 (HRA).
UPDATE
  cse_students
SET
  parent_inc = parent_inc + 5000;

-- Delete the view.
DROP VIEW cse_stud;

-- Create another view of all students in dept Mechanical Engineering (department Name).
CREATE VIEW mec_stud AS
SELECT
  rollno,
  name,
  deptcode,
  DATE_PART('year', AGE(bdate)) AS age
FROM
  students
WHERE
  deptcode = 'MEC';

-- The view will contain attributes namely Roll-No, Name, Department Name, Age.
-- Attempt the following:
-- Insert a new student of Mechanical Engineering Department.
INSERT INTO
  students
VALUES
  (
    51019004,
    'Krishnendu',
    date('2000-02-03'),
    'MEC',
    6,
    573600
  );

-- Delete a student (for a given Name) of the same department
DELETE FROM
  students
WHERE
  name = 'Krishnendu';

-- Shift a student (for a given Name) from Mechanical to Computer Science.
UPDATE
  mec_stud
SET
  deptcode = 'CSE'
WHERE
  name = 'Anik Das';

-- For each of the above cases, analyse the result.
INSERT INTO
  cse_stud_test
VALUES
  (
    51019069,
    'Krishnendu',
    date('2000-02-03'),
    'CSE',
    6,
    573600
  );
