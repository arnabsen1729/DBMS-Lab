DO $$
DECLARE
    srno INTEGER;

BEGIN
    SELECT
        INTO srno COUNT(reg_count)
    FROM
        table_name
    WHERE
        condition;

RAISE notice 'Desired Count %',
srno;

END $$;
