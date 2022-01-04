DROP TABLE IF EXISTS shipment;

DROP TABLE IF EXISTS customer;

DROP TABLE IF EXISTS city;

DROP TABLE IF EXISTS truck;

CREATE TABLE CUSTOMER(
    CUST_ID NUMERIC(5) PRIMARY KEY CHECK(
        CUST_ID >= 100
        AND CUST_ID < 10000
    ),
    CUST_NAME VARCHAR(20),
    ANNUAL_REVENUE NUMERIC(8),
    CUST_TYPE VARCHAR(15) CHECK(
        CUST_TYPE IN ('MANUFACTURER', 'WHOLESELLER', 'RETAILER')
    )
);

CREATE TABLE TRUCK(
    TRUCK_NO NUMERIC(5) PRIMARY KEY,
    DRIVER_NAME VARCHAR(20)
);

CREATE TABLE CITY(
    CITY_NAME VARCHAR(20) PRIMARY KEY,
    POPULATION NUMERIC(8)
);

CREATE TABLE shipment(
    shipment_no varchar(6),
    cust_id numeric(6) REFERENCES customer(cust_id) ON DELETE CASCADE,
    weight numeric(4) CHECK(weight < 1000),
    truck_no numeric(5) REFERENCES truck(truck_no) ON DELETE
    SET
        NULL,
        destination varchar(20) REFERENCES city(city_name),
        ship_date date,
        PRIMARY KEY(shipment_no, cust_id)
);

INSERT INTO
    city
VALUES
    ('Bangalore', 5100000),
    ('Mumbai', 7200000),
    ('Delhi', 10000000),
    ('Chennai', 8000000),
    ('Hyderabad', 6000000),
    ('Kolkata', 5000000);

INSERT INTO
    customer
VALUES
    (1501, 'Anay', 2251690, 'MANUFACTURER'),
    (1502, 'Faiyaz', 9204049, 'RETAILER'),
    (1503, 'Divij', 3211435, 'RETAILER'),
    (1504, 'Dhruv', 4687373, 'WHOLESELLER'),
    (1505, 'Trisha', 2396161, 'MANUFACTURER'),
    (1506, 'Jayesh', 7513219, 'WHOLESELLER'),
    (1507, 'Drishya', 2695277, 'RETAILER'),
    (1508, 'Divij', 5928153, 'WHOLESELLER'),
    (1509, 'Shanaya', 7812942, 'RETAILER'),
    (1510, 'Pihu', 2066160, 'WHOLESELLER');

INSERT INTO
    truck
VALUES
    (18001, 'Purab'),
    (18002, 'Chirag'),
    (18003, 'Kiara'),
    (18004, 'Sumer'),
    (18005, 'Drishya'),
    (18006, 'Anika'),
    (18007, 'Fateh'),
    (18008, 'Khushi'),
    (18009, 'Badal'),
    (18010, 'Riaan');

INSERT INTO
    shipment
VALUES
    (12001, 1505, 855, 18001, 'Chennai', '2021-10-04'),
    (12002, 1505, 175, 18002, 'Kolkata', '2021-02-17'),
    (12003, 1502, 618, 18007, 'Mumbai', '2020-11-21'),
    (12003, 1503, 618, 18007, 'Mumbai', '2020-11-21'),
    (12003, 1507, 618, 18007, 'Mumbai', '2020-11-21'),
    (12003, 1501, 618, 18007, 'Mumbai', '2020-11-21'),
    (12004, 1505, 886, 18001, 'Mumbai', '2021-07-23'),
    (12005, 1507, 269, 18002, 'Chennai', '2021-05-23'),
    (12006, 1508, 479, 18003, 'Mumbai', '2021-08-12'),
    (12007, 1510, 496, 18001, 'Mumbai', '2021-07-10'),
    (12008, 1510, 977, 18005, 'Kolkata', '2021-05-27'),
    (
        12009,
        1506,
        741,
        18005,
        'Bangalore',
        '2020-11-11'
    ),
    (12010, 1505, 746, 18006, 'Kolkata', '2021-09-15'),
    (
        12011,
        1501,
        291,
        18001,
        'Hyderabad',
        '2021-10-16'
    ),
    (
        12012,
        1503,
        287,
        18003,
        'Bangalore',
        '2021-10-19'
    ),
    (
        12013,
        1510,
        905,
        18009,
        'Hyderabad',
        '2021-06-23'
    ),
    (12014, 1509, 714, 18002, 'Delhi', '2021-10-08'),
    (
        12015,
        1508,
        727,
        18003,
        'Hyderabad',
        '2021-06-15'
    ),
    (12016, 1504, 636, 18007, 'Kolkata', '2021-03-06'),
    (12017, 1504, 508, 18010, 'Delhi', '2021-04-01'),
    (12018, 1510, 871, 18008, 'Kolkata', '2020-12-29'),
    (12019, 1502, 248, 18003, 'Kolkata', '2021-02-10'),
    (
        12020,
        1506,
        357,
        18001,
        'Bangalore',
        '2021-07-29'
    ),
    (12021, 1501, 319, 18005, 'Kolkata', '2021-02-23'),
    (12022, 1502, 217, 18002, 'Mumbai', '2021-03-08'),
    (12023, 1505, 876, 18004, 'Kolkata', '2021-06-19'),
    (12024, 1501, 453, 18002, 'Kolkata', '2021-05-24'),
    (
        12025,
        1504,
        412,
        18001,
        'Bangalore',
        '2021-10-06'
    ),
    (
        12026,
        1506,
        334,
        18006,
        'Hyderabad',
        '2021-09-03'
    ),
    (12027, 1505, 660, 18006, 'Kolkata', '2021-06-03'),
    (12028, 1506, 319, 18010, 'Kolkata', '2021-04-17'),
    (12029, 1505, 962, 18006, 'Kolkata', '2021-04-23'),
    (12030, 1507, 930, 18010, 'Chennai', '2020-12-27'),
    (12031, 1509, 132, 18003, 'Mumbai', '2020-12-12'),
    (12032, 1502, 318, 18002, 'Delhi', '2021-05-28'),
    (12033, 1505, 272, 18010, 'Chennai', '2021-07-08'),
    (12034, 1504, 922, 18010, 'Kolkata', '2021-03-23'),
    (
        12035,
        1510,
        501,
        18003,
        'Bangalore',
        '2021-04-10'
    ),
    (12036, 1505, 891, 18004, 'Kolkata', '2021-02-15'),
    (12037, 1504, 563, 18007, 'Mumbai', '2021-10-06'),
    (12038, 1505, 333, 18007, 'Mumbai', '2020-12-11'),
    (
        12039,
        1503,
        738,
        18002,
        'Bangalore',
        '2021-08-08'
    ),
    (12040, 1510, 708, 18010, 'Mumbai', '2021-04-10'),
    (12041, 1506, 770, 18009, 'Mumbai', '2021-06-13'),
    (
        12042,
        1507,
        920,
        18006,
        'Hyderabad',
        '2020-10-26'
    ),
    (
        12043,
        1502,
        198,
        18002,
        'Hyderabad',
        '2020-12-26'
    ),
    (12044, 1505, 627, 18009, 'Delhi', '2021-06-16'),
    (
        12045,
        1510,
        736,
        18006,
        'Hyderabad',
        '2021-03-17'
    ),
    (12046, 1508, 125, 18004, 'Delhi', '2020-10-22'),
    (
        12047,
        1508,
        383,
        18003,
        'Bangalore',
        '2020-10-29'
    ),
    (
        12048,
        1509,
        268,
        18009,
        'Bangalore',
        '2020-12-08'
    ),
    (
        12049,
        1509,
        903,
        18005,
        'Bangalore',
        '2021-04-17'
    ),
    (12050, 1503, 864, 18002, 'Chennai', '2021-10-18');
