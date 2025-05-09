-- Section C

-- Modifications
ALTER TABLE student
ADD gpa NUMERIC(4, 2),
ADD gpa_last_updated DATE;

-- Grade Mapping Function
CREATE OR REPLACE FUNCTION get_grade_point(grade_input CHAR(2))
RETURNS NUMERIC
AS $$

-- Declare variable to store the calculated grade point
DECLARE grade_point NUMERIC;

BEGIN
	-- Use a CASE statement to match the input grade and assign the corresponding grade point
	grade_point := CASE
	-- TODO: Complete the CASE statement
	WHEN grade_input = 'AD' THEN 4.0
	WHEN grade_input = 'A' THEN 4.0
	WHEN grade_input = 'B+' THEN 3.5
	WHEN grade_input = 'B' THEN 3.0
	WHEN grade_input = 'C+' THEN 2.5
	WHEN grade_input = 'C' THEN 2.0
	WHEN grade_input = 'D+' THEN 1.5
	WHEN grade_input = 'D' THEN 1.0
	-- TODO: Raise an exception to indicate 'Invalid Grade' if there is no match;
	ELSE
		RAISE EXCEPTION 'Invalid grade input!';
	END CASE;
	-- Return the calculated grade point
	RETURN grade_point;
END;

$$ LANGUAGE plpgsql;