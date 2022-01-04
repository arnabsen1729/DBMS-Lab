CREATE TABLE DEPT(
    DEPTNO varchar(5) PRIMARY KEY CHECK (DEPTNO LIKE 'D%'),
    DNAME varchar(10) CHECK (
        DNAME IN ('Accounting', 'Sales', 'Research', 'Operations')
    ),
    LOC varchar(10)
);

CREATE TABLE EMP(
    EMPNO numeric(10) PRIMARY KEY CHECK (
        EMPNO BETWEEN 7000
        AND 8000
    ),
    ENAME varchar(10),
    JOB varchar(10) CHECK (
        JOB IN(
            'President',
            'Manager',
            'Clerk',
            'Salesman',
            'Analyst'
        )
    ),
    MGR numeric(10),
    HIREDATE date,
    SAL numeric(10),
    COMM numeric(5) DEFAULT 0 CHECK(COMM < 1500),
    DEPTNO varchar(5) REFERENCES DEPT(DEPTNO)
);

INSERT INTO
    DEPT
VALUES
    ('D501', 'Accounting', 'Bangalore'),
    ('D502', 'Sales', 'Mumbai'),
    ('D503', 'Research', 'Delhi'),
    ('D504', 'Operations', 'Kolkata');

INSERT INTO
    EMP
VALUES
    (
        7001,
        'Siya',
        'Manager',
        7012,
        '2021-10-02',
        868832,
        524,
        'D504'
    ),
    (
        7002,
        'Nitara',
        'Salesman',
        7003,
        '2018-07-27',
        449084,
        1483,
        'D504'
    ),
    (
        7003,
        'Taran',
        'President',
        7021,
        '2019-04-14',
        521931,
        744,
        'D503'
    ),
    (
        7004,
        'Ryan',
        'Analyst',
        7013,
        '2020-12-27',
        813011,
        596,
        'D504'
    ),
    (
        7005,
        'Elakshi',
        'Analyst',
        7020,
        '2021-03-12',
        419489,
        623,
        'D502'
    ),
    (
        7006,
        'Tiya',
        'Analyst',
        7017,
        '2019-11-03',
        819509,
        1481,
        'D503'
    ),
    (
        7007,
        'Anay',
        'President',
        7019,
        '2019-06-15',
        508258,
        994,
        'D503'
    ),
    (
        7008,
        'Emir',
        'Clerk',
        7018,
        '2020-01-25',
        230833,
        141,
        'D503'
    ),
    (
        7009,
        'Darshit',
        'Manager',
        7011,
        '2020-10-06',
        837821,
        700,
        'D502'
    ),
    (
        7010,
        'Riaan',
        'Clerk',
        7006,
        '2021-05-30',
        412574,
        236,
        'D504'
    ),
    (
        7011,
        'Manjari',
        'Clerk',
        7029,
        '2020-12-04',
        227470,
        793,
        'D501'
    ),
    (
        7012,
        'Anya',
        'Manager',
        7020,
        '2018-06-08',
        228067,
        462,
        'D503'
    ),
    (
        7013,
        'Myra',
        'President',
        7001,
        '2019-03-26',
        464972,
        290,
        'D501'
    ),
    (
        7014,
        'Samarth',
        'Analyst',
        7020,
        '2021-04-12',
        594219,
        272,
        'D503'
    ),
    (
        7015,
        'Pranay',
        'President',
        7010,
        '2018-08-20',
        317848,
        156,
        'D502'
    ),
    (
        7016,
        'Anya',
        'Analyst',
        7019,
        '2018-11-29',
        738801,
        381,
        'D504'
    ),
    (
        7017,
        'Nitya',
        'Clerk',
        7012,
        '2018-09-12',
        311961,
        1489,
        'D501'
    ),
    (
        7018,
        'Hridaan',
        'Salesman',
        7028,
        '2019-02-03',
        335515,
        196,
        'D502'
    ),
    (
        7019,
        'Zoya',
        'Analyst',
        7012,
        '2018-03-21',
        480108,
        950,
        'D503'
    ),
    (
        7020,
        'Shaan',
        'Clerk',
        7010,
        '2018-11-17',
        568221,
        389,
        'D504'
    ),
    (
        7021,
        'Drishya',
        'President',
        7019,
        '2018-03-21',
        383705,
        260,
        'D504'
    ),
    (
        7022,
        'Arhaan',
        'Clerk',
        7003,
        '2020-07-16',
        414499,
        351,
        'D504'
    ),
    (
        7023,
        'Jivika',
        'President',
        7006,
        '2021-04-29',
        365866,
        122,
        'D501'
    ),
    (
        7024,
        'Renee',
        'Manager',
        7015,
        '2021-03-02',
        271270,
        25,
        'D502'
    ),
    (
        7025,
        'Uthkarsh',
        'Salesman',
        7021,
        '2021-09-07',
        928321,
        994,
        'D501'
    ),
    (
        7026,
        'Stuvan',
        'Clerk',
        7024,
        '2020-10-12',
        424175,
        358,
        'D503'
    ),
    (
        7027,
        'Neysa',
        'Manager',
        7004,
        '2018-03-26',
        979489,
        950,
        'D503'
    ),
    (
        7028,
        'Akarsh',
        'Analyst',
        7018,
        '2016-11-23',
        890624,
        1441,
        'D502'
    ),
    (
        7029,
        'Emir',
        'Clerk',
        7008,
        '2019-07-22',
        530053,
        1250,
        'D501'
    ),
    (
        7030,
        'Tejas',
        'Clerk',
        7015,
        '2021-09-17',
        577606,
        691,
        'D501'
    );

SELECT
    DNAME,
    max(SAL) - min(SAL) AS Difference
FROM
    DEPT d,
    EMP e
WHERE
    d.DEPTNO = e.DEPTNO
GROUP BY
    D.DEPTNO
ORDER BY
    Difference DESC;

SELECT
    a.EMPNO AS employee_id,
    a.ENAME AS employee_name,
    b.EMPNO AS manager_id,
    b.ENAME AS manager_name
FROM
    EMP a,
    EMP b
WHERE
    a.MGR = b.EMPNO;

SELECT
    TOTAL,
    TOTAL_2020
FROM
    (
        SELECT
            count(*) AS TOTAL
        FROM
            EMP
    ) AS hd1,
    (
        SELECT
            count(*) AS TOTAL_2020
        FROM
            EMP
        WHERE
            EXTRACT(
                YEAR
                FROM
                    HIREDATE
            ) = 2020
    ) AS hd2;

SELECT
    MGR AS manager_id,
    min(SAL) AS min_salary
FROM
    EMP
GROUP BY
    MGR
HAVING
    MGR IS NOT NULL
    AND min(SAL) < 1000;

SELECT
    DNAME AS "DNAME",
    LOC AS "LOCATION",
    count(*) AS "NUMBER OF PEOPLE",
    coalesce(round(avg(SAL), 2), 0.0) AS "AVERAGE SALARY"
FROM
    DEPT
    LEFT JOIN EMP ON (EMP.DEPTNO = DEPT.DEPTNO)
GROUP BY
    DNAME,
    LOC;

SELECT
    MGR AS manager_id,
    min(SAL) AS minSalary
FROM
    EMP
GROUP BY
    MGR
HAVING
    MGR IS NOT NULL
    AND min(SAL) < 300000
ORDER BY
    minSalary DESC;
