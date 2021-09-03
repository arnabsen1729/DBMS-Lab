DROP TABLE IF EXISTS crs_regd;

DROP TABLE IF EXISTS crs_offrd;

DROP TABLE IF EXISTS faculty;

DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS depts;

CREATE TABLE depts(
  deptcode char(3) PRIMARY KEY,
  deptname char(30) NOT NULL
);

INSERT INTO
  depts(deptcode, deptname)
VALUES
  ('CHE', 'Chemistry'),
  ('CSE', 'Computer Science'),
  ('ELE', 'Electrical'),
  ('ETC', 'Electronics'),
  ('IT', 'Information Tech'),
  ('MEC', 'Mechanical'),
  ('PHY', 'Physics');

CREATE TABLE students(
  rollno numeric(8) PRIMARY KEY,
  name char(30),
  bdate date CHECK(bdate > date('1997-01-01')),
  deptcode char(3) REFERENCES depts(deptcode) ON DELETE CASCADE,
  hostel numeric CHECK(hostel < 10),
  parent_inc numeric(8, 1)
);

CREATE TABLE faculty(
  fac_code char(8) PRIMARY KEY,
  fac_name char(30) NOT NULL,
  fac_dept char(3) REFERENCES depts(deptcode)
);

CREATE TABLE crs_offrd(
  crs_code char(5) PRIMARY KEY,
  crs_name char(35) NOT NULL,
  crs_credits numeric(2, 1),
  crs_fac_cd char(8) REFERENCES faculty(fac_code)
);

CREATE TABLE crs_regd(
  crs_rollno numeric(8) REFERENCES students(rollno),
  crs_cd char(5) REFERENCES crs_offrd(crs_code),
  marks numeric(5, 2),
  PRIMARY KEY(crs_rollno, crs_cd)
);

INSERT INTO
  students
VALUES
  (
    '51052985',
    'Jayant',
    '2000-01-01',
    'MEC',
    '1',
    '8780000'
  );

INSERT INTO
  students
VALUES
  (
    '51054491',
    'Shaan',
    '2000-07-25',
    'PHY',
    '2',
    '7460000'
  );

INSERT INTO
  students
VALUES
  (
    '51053017',
    'Chirag',
    '2000-02-03',
    'IT',
    '4',
    '1140000'
  );

INSERT INTO
  students
VALUES
  (
    '51052423',
    'Ehsaan',
    '2000-03-23',
    'ETC',
    '3',
    '5380000'
  );

INSERT INTO
  students
VALUES
  (
    '51051159',
    'Shanaya',
    '2000-12-03',
    'ETC',
    '6',
    '6800000'
  );

INSERT INTO
  students
VALUES
  (
    '51058167',
    'Divij',
    '2000-02-14',
    'CSE',
    '6',
    '6290000'
  );

INSERT INTO
  students
VALUES
  (
    '51055679',
    'Seher',
    '2000-04-03',
    'ETC',
    '8',
    '5050000'
  );

INSERT INTO
  students
VALUES
  (
    '51055573',
    'Parinaaz',
    '2000-12-20',
    'ELE',
    '9',
    '4850000'
  );

INSERT INTO
  students
VALUES
  (
    '51055787',
    'Riya',
    '2001-07-07',
    'PHY',
    '7',
    '9810000'
  );

INSERT INTO
  students
VALUES
  (
    '51051803',
    'Onkar',
    '2001-07-11',
    'ELE',
    '7',
    '8760000'
  );

INSERT INTO
  students
VALUES
  (
    '51056805',
    'Yakshit',
    '2001-03-19',
    'ETC',
    '9',
    '2820000'
  );

INSERT INTO
  students
VALUES
  (
    '51050567',
    'Ranbir',
    '1999-11-25',
    'ELE',
    '4',
    '5500000'
  );

INSERT INTO
  students
VALUES
  (
    '51054776',
    'Divyansh',
    '2001-04-14',
    'ETC',
    '7',
    '8680000'
  );

INSERT INTO
  students
VALUES
  (
    '51051394',
    'Aayush',
    '2001-06-17',
    'ETC',
    '5',
    '3440000'
  );

INSERT INTO
  students
VALUES
  (
    '51059691',
    'Ayesha',
    '2001-01-02',
    'ETC',
    '7',
    '8710000'
  );

INSERT INTO
  students
VALUES
  (
    '51057039',
    'Zain',
    '2000-12-06',
    'CHE',
    '8',
    '3330000'
  );

INSERT INTO
  students
VALUES
  (
    '51053522',
    'Shanaya',
    '2000-03-06',
    'ELE',
    '3',
    '2900000'
  );

INSERT INTO
  students
VALUES
  (
    '51059658',
    'Vihaan',
    '2000-11-30',
    'ELE',
    '4',
    '4800000'
  );

INSERT INTO
  students
VALUES
  (
    '51051337',
    'Rania',
    '1999-11-30',
    'ETC',
    '2',
    '8030000'
  );

INSERT INTO
  students
VALUES
  (
    '51059178',
    'Adah',
    '2001-08-07',
    'PHY',
    '7',
    '4620000'
  );

INSERT INTO
  students
VALUES
  (
    '51054427',
    'Pranay',
    '2000-04-13',
    'CHE',
    '1',
    '3570000'
  );

INSERT INTO
  students
VALUES
  (
    '51050243',
    'Elakshi',
    '2000-11-09',
    'CHE',
    '9',
    '5300000'
  );

INSERT INTO
  students
VALUES
  (
    '51054930',
    'Vritika',
    '2000-10-09',
    'CHE',
    '1',
    '3880000'
  );

INSERT INTO
  students
VALUES
  (
    '51050736',
    'Parinaaz',
    '2000-06-22',
    'ELE',
    '1',
    '3950000'
  );

INSERT INTO
  students
VALUES
  (
    '51052529',
    'Rati',
    '2000-04-24',
    'MEC',
    '8',
    '6760000'
  );

INSERT INTO
  students
VALUES
  (
    '51050488',
    'Hunar',
    '2000-11-09',
    'CHE',
    '3',
    '3020000'
  );

INSERT INTO
  students
VALUES
  (
    '51053419',
    'Keya',
    '2001-07-25',
    'CSE',
    '6',
    '5570000'
  );

INSERT INTO
  students
VALUES
  (
    '51051744',
    'Pari',
    '2001-04-01',
    'ETC',
    '8',
    '7820000'
  );

INSERT INTO
  students
VALUES
  (
    '51050192',
    'Anay',
    '2000-11-18',
    'CHE',
    '7',
    '2500000'
  );

INSERT INTO
  students
VALUES
  (
    '51052466',
    'Misha',
    '2000-09-27',
    'MEC',
    '3',
    '1820000'
  );

INSERT INTO
  faculty
VALUES
  ('CHE_F1', 'Samiha', 'CHE');

INSERT INTO
  faculty
VALUES
  ('CHE_F2', 'Aayush', 'CHE');

INSERT INTO
  faculty
VALUES
  ('CSE_F1', 'Anya', 'CSE');

INSERT INTO
  faculty
VALUES
  ('CSE_F2', 'Aaryahi', 'CSE');

INSERT INTO
  faculty
VALUES
  ('ELE_F1', 'Hrishita', 'ELE');

INSERT INTO
  faculty
VALUES
  ('ELE_F2', 'Shlok', 'ELE');

INSERT INTO
  faculty
VALUES
  ('ETC_F1', 'Nakul', 'ETC');

INSERT INTO
  faculty
VALUES
  ('ETC_F2', 'Vanya', 'ETC');

INSERT INTO
  faculty
VALUES
  ('IT_F1', 'Kiaan', 'IT');

INSERT INTO
  faculty
VALUES
  ('IT_F2', 'Suhana', 'IT');

INSERT INTO
  faculty
VALUES
  ('PHY_F1', 'Advik', 'PHY');

INSERT INTO
  faculty
VALUES
  ('PHY_F2', 'Rati', 'PHY');

INSERT INTO
  faculty
VALUES
  ('MEC_F1', 'Sahil', 'MEC');

INSERT INTO
  faculty
VALUES
  ('MEC_F2', 'Siya', 'MEC');

INSERT INTO
  crs_offrd
VALUES
  ('CSE_1', 'CSE Course 1', 4, 'CSE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('CSE_2', 'CSE Course 2', 5, 'CSE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('CSE_3', 'CSE Course 3', 6, 'CSE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('CSE_4', 'CSE Course 4', 7, 'CSE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('CHE_1', 'CHE Course 1', 4, 'CHE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('CHE_2', 'CHE Course 2', 5, 'CHE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('CHE_3', 'CHE Course 3', 6, 'CHE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('CHE_4', 'CHE Course 4', 7, 'CHE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('ETC_1', 'ETC Course 1', 4, 'ETC_F1');

INSERT INTO
  crs_offrd
VALUES
  ('ETC_2', 'ETC Course 2', 5, 'ETC_F2');

INSERT INTO
  crs_offrd
VALUES
  ('ETC_3', 'ETC Course 3', 6, 'ETC_F1');

INSERT INTO
  crs_offrd
VALUES
  ('ETC_4', 'ETC Course 4', 7, 'ETC_F2');

INSERT INTO
  crs_offrd
VALUES
  ('ELE_1', 'ELE Course 1', 4, 'ELE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('ELE_2', 'ELE Course 2', 5, 'ELE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('ELE_3', 'ELE Course 3', 6, 'ELE_F1');

INSERT INTO
  crs_offrd
VALUES
  ('ELE_4', 'ELE Course 4', 7, 'ELE_F2');

INSERT INTO
  crs_offrd
VALUES
  ('IT_1', 'IT Course 1', 6, 'IT_F1');

INSERT INTO
  crs_offrd
VALUES
  ('IT_2', 'IT Course 2', 7, 'IT_F2');

INSERT INTO
  crs_offrd
VALUES
  ('IT_3', 'IT Course 3', 5, 'IT_F1');

INSERT INTO
  crs_offrd
VALUES
  ('IT_4', 'IT Course 4', 4, 'IT_F2');

INSERT INTO
  crs_offrd
VALUES
  ('MEC_1', 'MEC Course 1', 6, 'MEC_F1');

INSERT INTO
  crs_offrd
VALUES
  ('MEC_2', 'MEC Course 2', 4, 'MEC_F2');

INSERT INTO
  crs_offrd
VALUES
  ('MEC_3', 'MEC Course 3', 5, 'MEC_F1');

INSERT INTO
  crs_offrd
VALUES
  ('MEC_4', 'MEC Course 4', 7, 'MEC_F2');

INSERT INTO
  crs_offrd
VALUES
  ('PHY_1', 'PHY Course 1', 6, 'PHY_F1');

INSERT INTO
  crs_offrd
VALUES
  ('PHY_2', 'PHY Course 2', 4, 'PHY_F2');

INSERT INTO
  crs_offrd
VALUES
  ('PHY_3', 'PHY Course 3', 5, 'PHY_F1');

INSERT INTO
  crs_offrd
VALUES
  ('PHY_4', 'PHY Course 4', 7, 'PHY_F2');

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'MEC_1', 100);

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'MEC_2', 71);

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'MEC_3', 93);

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'MEC_4', 84);

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'ETC_1', 77);

INSERT INTO
  crs_regd
VALUES
  ('51052985', 'ELE_2', 74);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'PHY_1', 73);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'PHY_2', 81);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'PHY_3', 89);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'PHY_4', 74);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'ELE_1', 73);

INSERT INTO
  crs_regd
VALUES
  ('51054491', 'CHE_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'IT_1', 76);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'IT_2', 72);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'IT_3', 86);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'IT_4', 92);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'MEC_1', 70);

INSERT INTO
  crs_regd
VALUES
  ('51053017', 'PHY_2', 98);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'ETC_1', 92);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'ETC_2', 71);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'ETC_3', 73);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'ETC_4', 78);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'MEC_1', 82);

INSERT INTO
  crs_regd
VALUES
  ('51052423', 'CSE_2', 97);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'ETC_1', 91);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'ETC_2', 77);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'ETC_3', 95);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'ETC_4', 89);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'ELE_1', 74);

INSERT INTO
  crs_regd
VALUES
  ('51051159', 'IT_2', 94);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'CSE_1', 77);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'CSE_2', 92);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'CSE_3', 93);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'CSE_4', 94);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'IT_1', 96);

INSERT INTO
  crs_regd
VALUES
  ('51058167', 'MEC_2', 74);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'ETC_1', 88);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'ETC_2', 71);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'ETC_3', 86);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'ETC_4', 83);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'PHY_1', 88);

INSERT INTO
  crs_regd
VALUES
  ('51055679', 'ELE_2', 99);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'ELE_1', 76);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'ELE_2', 78);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'ELE_3', 77);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'ELE_4', 88);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'MEC_1', 70);

INSERT INTO
  crs_regd
VALUES
  ('51055573', 'CHE_2', 87);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'PHY_1', 75);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'PHY_2', 75);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'PHY_3', 71);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'PHY_4', 89);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'CHE_1', 73);

INSERT INTO
  crs_regd
VALUES
  ('51055787', 'ELE_2', 91);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'ELE_1', 70);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'ELE_2', 71);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'ELE_3', 89);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'ELE_4', 94);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'IT_1', 84);

INSERT INTO
  crs_regd
VALUES
  ('51051803', 'ETC_2', 94);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'ETC_1', 82);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'ETC_2', 89);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'ETC_3', 73);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'ETC_4', 93);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'PHY_1', 88);

INSERT INTO
  crs_regd
VALUES
  ('51056805', 'MEC_2', 90);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'ELE_1', 95);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'ELE_2', 99);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'ELE_3', 92);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'ELE_4', 77);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'IT_1', 89);

INSERT INTO
  crs_regd
VALUES
  ('51050567', 'PHY_2', 96);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'ETC_1', 72);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'ETC_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'ETC_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'ETC_4', 83);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'CSE_1', 88);

INSERT INTO
  crs_regd
VALUES
  ('51054776', 'ELE_2', 98);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'ETC_1', 75);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'ETC_2', 73);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'ETC_3', 71);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'ETC_4', 71);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'IT_1', 90);

INSERT INTO
  crs_regd
VALUES
  ('51051394', 'MEC_2', 91);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ETC_1', 84);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ETC_2', 84);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ETC_3', 81);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ETC_4', 81);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ELE_1', 81);

INSERT INTO
  crs_regd
VALUES
  ('51059691', 'ELE_2', 71);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'CHE_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'CHE_2', 94);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'CHE_3', 72);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'CHE_4', 83);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'ETC_1', 80);

INSERT INTO
  crs_regd
VALUES
  ('51057039', 'CSE_2', 74);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'ELE_1', 92);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'ELE_2', 96);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'ELE_3', 88);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'ELE_4', 73);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'CSE_1', 75);

INSERT INTO
  crs_regd
VALUES
  ('51053522', 'ETC_2', 95);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ELE_1', 80);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ELE_2', 92);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ELE_3', 100);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ELE_4', 97);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ETC_1', 73);

INSERT INTO
  crs_regd
VALUES
  ('51059658', 'ETC_2', 98);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'ETC_1', 80);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'ETC_2', 74);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'ETC_3', 87);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'ETC_4', 99);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'CSE_1', 99);

INSERT INTO
  crs_regd
VALUES
  ('51051337', 'IT_2', 75);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'PHY_1', 94);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'PHY_2', 76);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'PHY_3', 86);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'PHY_4', 74);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'ELE_1', 99);

INSERT INTO
  crs_regd
VALUES
  ('51059178', 'MEC_2', 88);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'CHE_1', 77);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'CHE_2', 87);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'CHE_3', 99);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'CHE_4', 75);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'PHY_1', 71);

INSERT INTO
  crs_regd
VALUES
  ('51054427', 'IT_2', 73);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'CHE_1', 82);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'CHE_2', 93);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'CHE_3', 99);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'CHE_4', 97);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'CSE_1', 75);

INSERT INTO
  crs_regd
VALUES
  ('51050243', 'IT_2', 72);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'CHE_1', 72);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'CHE_2', 81);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'CHE_3', 98);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'CHE_4', 88);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'ETC_1', 99);

INSERT INTO
  crs_regd
VALUES
  ('51054930', 'PHY_2', 89);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'ELE_1', 93);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'ELE_2', 96);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'ELE_3', 78);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'ELE_4', 83);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'IT_1', 86);

INSERT INTO
  crs_regd
VALUES
  ('51050736', 'MEC_2', 98);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'MEC_1', 81);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'MEC_2', 89);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'MEC_3', 87);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'MEC_4', 92);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'ETC_1', 71);

INSERT INTO
  crs_regd
VALUES
  ('51052529', 'ELE_2', 96);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'CHE_1', 86);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'CHE_2', 87);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'CHE_3', 88);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'CHE_4', 76);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'ETC_1', 85);

INSERT INTO
  crs_regd
VALUES
  ('51050488', 'ELE_2', 89);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'CSE_1', 88);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'CSE_2', 89);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'CSE_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'CSE_4', 83);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'ETC_1', 95);

INSERT INTO
  crs_regd
VALUES
  ('51053419', 'MEC_2', 83);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'ETC_1', 82);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'ETC_2', 81);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'ETC_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'ETC_4', 92);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'MEC_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51051744', 'IT_2', 85);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'CHE_1', 81);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'CHE_2', 96);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'CHE_3', 95);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'CHE_4', 74);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'MEC_1', 72);

INSERT INTO
  crs_regd
VALUES
  ('51050192', 'PHY_2', 75);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'MEC_1', 96);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'MEC_2', 90);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'MEC_3', 92);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'MEC_4', 76);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'IT_1', 78);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ETC_2', 82);

INSERT INTO
  students
VALUES
  (
    '51056947',
    'Jayesh',
    '2000-12-18',
    'MEC',
    '8',
    '4810000'
  );

INSERT INTO
  students
VALUES
  (
    '51053253',
    'Aniruddh',
    '2000-06-20',
    'CHE',
    '4',
    '6590000'
  );

INSERT INTO
  students
VALUES
  (
    '51056320',
    'Nirvi',
    '2000-06-18',
    'ELE',
    '9',
    '4500000'
  );

INSERT INTO
  students
VALUES
  (
    '51052803',
    'Shamik',
    '1999-11-27',
    'PHY',
    '2',
    '6180000'
  );

INSERT INTO
  students
VALUES
  (
    '51055089',
    'Anvi',
    '2000-12-10',
    'IT',
    '9',
    '4640000'
  );

INSERT INTO
  students
VALUES
  (
    '51050564',
    'Shray',
    '2001-03-06',
    'ELE',
    '2',
    '7940000'
  );

INSERT INTO
  students
VALUES
  (
    '51058476',
    'Inaaya ',
    '2001-01-22',
    'PHY',
    '6',
    '6930000'
  );

INSERT INTO
  students
VALUES
  (
    '51054312',
    'Advik',
    '2000-02-19',
    'PHY',
    '6',
    '8060000'
  );

INSERT INTO
  students
VALUES
  (
    '51054790',
    'Nishith',
    '2001-05-23',
    'CSE',
    '4',
    '5900000'
  );

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ETC_2', 82);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CSE_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CSE_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CSE_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CSE_4', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CHE_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CHE_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CHE_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'CHE_4', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ETC_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ETC_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ETC_4', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ELE_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ELE_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ELE_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'ELE_4', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'IT_2 ', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'IT_3 ', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'IT_4 ', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'PHY_1', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'PHY_2', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'PHY_3', 79);

INSERT INTO
  crs_regd
VALUES
  ('51052466', 'PHY_4', 79);
