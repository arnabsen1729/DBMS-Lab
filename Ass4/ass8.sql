SELECT
    DISTINCT cust_name
FROM
    shipment s,
    customer c
WHERE
    s.cust_id = c.cust_id
    AND destination IN ('Chennai', 'Kolkata', 'Mumbai');

SELECT
    DISTINCT driver_name
FROM
    shipment s,
    truck t
WHERE
    s.truck_no = t.truck_no
    AND s.weight > 200;

SELECT
    max(weight) AS MaxWeight,
    min(weight) AS MinWeight
FROM
    shipment;

SELECT
    cust_id,
    avg(weight) AS AverageWeight
FROM
    shipment
GROUP BY
    cust_id
ORDER BY
    cust_id;

SELECT
    city_name,
    population
FROM
    shipment s,
    city c
WHERE
    s.destination = c.city_name
    AND weight > 100
GROUP BY
    city_name;

SELECT
    city_name
FROM
    shipment s,
    city c
WHERE
    s.destination = c.city_name
GROUP BY
    city_name
HAVING
    count(DISTINCT cust_id) = (
        SELECT
            count(*)
        FROM
            customer
    );

SELECT
    city_name,
    max(weight)
FROM
    city c,
    shipment s
WHERE
    c.city_name = s.destination
GROUP BY
    city_name;

SELECT
    cust_name,
    annual_revenue
FROM
    customer c,
    shipment s,
    truck t
WHERE
    c.cust_id = s.cust_id
    AND s.truck_no = t.truck_no
    AND driver_name = 'Kiara';

SELECT
    t.truck_no,
    t.driver_name
FROM
    shipment s,
    truck t
WHERE
    s.truck_no = t.truck_no
GROUP BY
    t.truck_no
HAVING
    count(DISTINCT(destination)) = (
        SELECT
            count(*)
        FROM
            city
    );

SELECT
    city_name,
    min(weight)
FROM
    shipment,
    city
WHERE
    destination = city_name
    AND population > 1000000
GROUP BY
    city_name;
