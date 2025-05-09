-- Section C

-- -- Modifications
-- ALTER TABLE student
-- ADD gpa NUMERIC(4, 2),
-- ADD gpa_last_updated DATE;

-- Grade Mapping Function
CREATE OR REPLACE FUNCTION get_grade_point(grade_input CHAR(2))
RETURNS NUMERIC
AS $$

-- Declare variable to store the calculated grade point
DECLARE grade_point NUMERIC;

BEGIN
	-- Use a CASE statement to match the input grade and assign the corresponding grade point
	CASE grade_input
        WHEN 'AD' THEN grade_point := 4.00;
        WHEN 'A'  THEN grade_point := 4.00;
        WHEN 'B+' THEN grade_point := 3.50;
        WHEN 'B'  THEN grade_point := 3.00;
        WHEN 'C+' THEN grade_point := 2.50;
        WHEN 'C'  THEN grade_point := 2.00;
        WHEN 'D+' THEN grade_point := 1.50;
        WHEN 'D'  THEN grade_point := 1.00;
        WHEN 'F'  THEN grade_point := 0.00;
	ELSE
		RAISE EXCEPTION 'Invalid Grade: %', grade_input;
    END CASE;
	-- Return the calculated grade point
	RETURN grade_point;
END;

$$ LANGUAGE plpgsql;

-- Stored Procedure to calculate and update GPAs for all students
CREATE OR REPLACE PROCEDURE calculate_students_gpa()
AS $$

-- Declare variables for procedure
DECLARE
	v_adm_no CHAR(4);
	v_mod_performance RECORD;
	total_credit_units INT; -- total credit unit for each student in nested loop
	total_weighted_grade_points NUMERIC; -- total grade points for each student in nested loop
	computed_gpa NUMERIC; -- gpa for each student
BEGIN
	-- Loop through stud_mod_performance
	FOR v_adm_no IN (
		-- TODO: Complete the IN clause. Retrieve the distinct admission numbers from stud_mod_performance
		SELECT DISTINCT adm_no FROM stud_mod_performance
	)
	LOOP
		-- Initialize total credit units and weighted grade points
		total_credit_units := 0;
		total_weighted_grade_points := 0;
		-- Nested loop that iterates over module performance records for a specific student
		-- to calculate gpa
		
		FOR v_mod_performance IN (
			-- TODO: Complete the SELECT statement. Retrieve the module performances for the specific student
			-- Join the stud_mod_performance table with the module table to get the
			-- credit unit and grade for each module
			-- Use the v_adm_no variable to filter for a specific student (eg WHERE clause)
			SELECT m.credit_unit, smp.grade
			FROM module m
			JOIN stud_mod_performance smp ON smp.mod_registered = m.mod_code
			WHERE smp.adm_no = v_adm_no
		)
		
		LOOP
			-- TODO: Calculate the total credit units and weighted grade points for
			-- the student based on the gpa formula. Use the get_grade_point function to map grade to
			-- grade points
			total_credit_units := total_credit_units + v_mod_performance.credit_unit;
			total_weighted_grade_points := total_weighted_grade_points + (v_mod_performance.credit_unit * get_grade_point(v_mod_performance.grade));
		END LOOP;
		
		-- Calculate GPA if total credit units are greater than 0
		IF total_credit_units > 0 THEN
			computed_gpa := total_weighted_grade_points / total_credit_units;
			-- TODO: Complete the Update statement to update computed gpa
			-- to the student table. use today's date for gpa_last_updated
			UPDATE student
			SET gpa = computed_gpa, gpa_last_updated = CURRENT_DATE
			WHERE adm_no = v_adm_no;
		
		END IF;
	END LOOP;
END;

$$ LANGUAGE plpgsql;