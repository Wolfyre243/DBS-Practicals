-- Section B

-- Create a function to count the number of each grade, grouped by module
CREATE OR REPLACE FUNCTION get_modules_performance()
RETURNS TABLE (
	mod_registered VARCHAR(10),
	grade CHAR(2),
	grade_count BIGINT
) AS 
$$
BEGIN
	-- Use RETURN QUERY to define the query to be executed
	RETURN QUERY
	-- TODO: Write the query to count the number of each grade, grouped by module
	SELECT smp.mod_registered, smp.grade, COUNT(*) as "Count of Grade"
	FROM stud_mod_performance smp
	GROUP BY smp.mod_registered, smp.grade
	ORDER BY smp.mod_registered ASC;
END;
$$
LANGUAGE plpgsql;