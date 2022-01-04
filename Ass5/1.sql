DROP TABLE IF EXISTS circle;

DROP FUNCTION IF EXISTS insertIntoCircle;

CREATE TABLE circle (
    radius NUMERIC PRIMARY KEY,
    circumference NUMERIC(10, 4)
);

CREATE FUNCTION insertIntoCircle(radius int) RETURNS real AS $$
DECLARE
    circumference DOUBLE PRECISION := 2 * pi() * radius;
BEGIN
    INSERT INTO circle VALUES (radius, circumference);
    RETURN circumference;
END;
$$ LANGUAGE plpgsql;

DO $$
    BEGIN
        perform insertIntoCircle(1);
        perform insertIntoCircle(4);
        perform insertIntoCircle(7);
        perform insertIntoCircle(8);
        perform insertIntoCircle(10);
    END;
$$;

SELECT * FROM circle;
