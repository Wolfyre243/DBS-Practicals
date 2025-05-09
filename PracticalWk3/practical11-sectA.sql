-- Section A

-- Create module stored procedure (without raising error)
CREATE OR REPLACE PROCEDURE create_module(
	IN p_code TEXT, 
	IN p_name TEXT, 
	IN p_credit INT
) AS $$
BEGIN

	-- Insert the new module
	INSERT INTO module (mod_code, mod_name, credit_unit) 
	VALUES (p_code, p_name, p_credit);

END;
$$ LANGUAGE plpgsql;

-- Update module stored procedure
CREATE OR REPLACE PROCEDURE update_module(
	IN p_credit INT,
	IN p_code TEXT
) AS $$
BEGIN

	-- check if module exists
	IF NOT EXISTS (SELECT * FROM module WHERE mod_code = p_code) THEN 
		RAISE EXCEPTION 'Module % does not exist', p_code;
	END IF;
	
	-- Update the module
	UPDATE module SET credit_unit = p_credit WHERE mod_code = p_code;

END;
$$ LANGUAGE plpgsql;

-- Delete module stored procedure
CREATE OR REPLACE PROCEDURE delete_module(
	IN p_code TEXT
) AS $$
BEGIN

	-- check if module exists
	IF NOT EXISTS (SELECT * FROM module WHERE mod_code = p_code) THEN 
		RAISE EXCEPTION 'Module % does not exist', p_code;
	END IF;
	
	-- Update the module
	DELETE FROM module WHERE mod_code = p_code;

END;
$$ LANGUAGE plpgsql;
