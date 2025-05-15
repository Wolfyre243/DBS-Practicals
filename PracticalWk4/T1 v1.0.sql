-- For Transaction T1 --
CREATE OR REPLACE PROCEDURE T1(
    INOUT results NUMERIC[]
)
LANGUAGE plpgsql
AS $$
DECLARE
  payment1 DECIMAL(7, 2);
  payment2 DECIMAL(7, 2);
BEGIN
    -- Initialize the array if it's not already initialized
    results := ARRAY[]::NUMERIC[];

    -- First SELECT
    SELECT amount_paid INTO payment1
    FROM payment_history
    WHERE payee_no = 'A999';

    -- Append result to array
    results := array_append(results, payment1);

    -- Sleep for 20 second
    PERFORM pg_sleep(10);

    -- Second SELECT
    SELECT amount_paid INTO payment2
    FROM payment_history
    WHERE payee_no = 'A999';

    -- Append result to array
    results := array_append(results, payment2);

END;
$$;


