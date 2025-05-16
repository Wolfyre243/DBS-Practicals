-- Q1
BEGIN TRANSACTION;

UPDATE staff_backup
SET hourly_rate = hourly_rate + 20;

COMMIT;

-- Q2
BEGIN TRANSACTION;

UPDATE staff_backup
SET staff_no = REPLACE(staff_no, 'S', 'A');

SELECT staff_no FROM staff_backup;

ROLLBACK;

SELECT staff_no FROM staff_backup;

-- Q3
BEGIN TRANSACTION;

SAVEPOINT initialState;

UPDATE staff_backup
SET staff_no = REPLACE(staff_no, 'S', 'B');

SAVEPOINT updated_staffNo;

UPDATE staff
SET hourly_rate = COALESCE(hourly_rate, 0) + 20;

ROLLBACK TO SAVEPOINT updated_StaffNo;

SELECT * FROM staff_backup;

-- Q4
CREATE OR REPLACE PROCEDURE transfer_staff(
	IN p_staff_no CHAR(4),
	IN p_new_dept_code VARCHAR(5)
)
LANGUAGE plpgsql
AS $$ 
DECLARE
	v_old_dept_code VARCHAR(5);
BEGIN
	-- TODO: Get the current department of the staff member
	v_old_dept_code := 
		(SELECT dept_code FROM staff s
		WHERE s.staff_no = p_staff_no);
		
	-- TODO: Increment 1 on no_of_staff for the new department
	UPDATE department
	SET no_of_staff = no_of_staff + 1
	WHERE dept_code = p_new_dept_code;
	
	-- TODO: Decrement 1 on no_of_staff for the old department
	UPDATE department
	SET no_of_staff = no_of_staff - 1
	WHERE dept_code = v_old_dept_code;
	
	-- TODO: Check if the staff member is a Head of Department. If so, raise
	-- an EXCEPTION 'Please manually update for HOD appointment holders.';
	IF EXISTS (SELECT * FROM staff WHERE p_staff_no IN (SELECT hod FROM department)) THEN
		RAISE EXCEPTION 'Please manually update for HOD appointment holders.';
	END IF;
	
	-- TODO: Set mod_coord to null if staff_no matches
	UPDATE module SET mod_coord = NULL
	WHERE mod_coord = p_staff_no;
	
	-- TODO: Set supervisor_staff_no to null if staff_no matches
	UPDATE staff SET supervisor_staff_no = NULL
	WHERE supervisor_staff_no = p_staff_no;
	
	-- TODO: Update the staff's dept_code to the new one
	UPDATE staff SET dept_code = p_new_dept_code
	WHERE staff_no = p_staff_no;

END;
$$;

-- Section C
CREATE TABLE payment_fee_type (
	fee_type SERIAL PRIMARY KEY NOT NULL,
	fee_name VARCHAR(20) NOT NULL
);

INSERT INTO payment_fee_type (fee_name)
VALUES
('crse_fee'),
('lab_fee');

CREATE TABLE payment_history (
	payment_id SERIAL PRIMARY KEY NOT NULL,
	payee_no VARCHAR(4),
	payment_date DATE NOT NULL,
	amount_paid DECIMAL(7,2) NOT NULL,
	fee_type INT NOT NULL,

	FOREIGN KEY (fee_type)
	REFERENCES payment_fee_type(fee_type)
);

ALTER TABLE course
ADD COLUMN max_crse_size INT DEFAULT 100;

-- Stored Procedure
CREATE OR REPLACE PROCEDURE enrol_new_student(
	IN adm_no_param CHAR(4),
	IN stud_name_param VARCHAR(30),
	IN gender_param CHAR(1),
	IN address_param VARCHAR(100),
	IN dob_param DATE,
	IN nationality_param VARCHAR(30),
	IN crse_code_param VARCHAR(5)
)
LANGUAGE plpgsql
AS $$
DECLARE
	max_size INTEGER;
	current_size INTEGER;
	current_crse_fee DECIMAL(7, 2);
	current_lab_fee DECIMAL(7, 2);
BEGIN
	-- Start the transaction
	BEGIN
		-- TODO: Fetch crse_fee and lab_fee in a single query
		SELECT crse_fee, lab_fee
		INTO current_crse_fee, current_lab_fee
		FROM course
		WHERE crse_code = crse_code_param;
		
		-- TODO: Insert records into payment_history for non-null fees
		IF current_crse_fee IS NOT NULL THEN
			INSERT INTO payment_history (payee_no, payment_date, amount_paid, fee_type)
			VALUES (
				adm_no_param, CURRENT_DATE, 0, 
				(SELECT fee_type FROM payment_fee_type WHERE fee_name = 'crse_fee')
			);
		END IF;

		IF current_lab_fee IS NOT NULL THEN
			INSERT INTO payment_history (payee_no, payment_date, amount_paid, fee_type)
			VALUES (
				adm_no_param, CURRENT_DATE, 0, 
				(SELECT fee_type FROM payment_fee_type WHERE fee_name = 'lab_fee')
			);
		END IF;
		
		-- TODO: Get the maximum course size for the specified course
		max_size := (SELECT max_crse_size FROM course WHERE crse_code = crse_code_param);
		
		-- TODO: Get the current number of students enrolled in the specified course
		current_size := (
			SELECT COUNT(*) FROM student
			WHERE crse_code = crse_code_param
		);
		
		IF -- TODO: Check if adding a new student exceeds the maximum course size
			current_size + 1 <= max_size
		THEN
			--TODO: Insert a new record into the student table
			INSERT INTO student (
				adm_no, stud_name, gender, address, dob, nationality, crse_code
			)
			VALUES
			(
				adm_no_param, stud_name_param, gender_param, address_param,
				dob_param, nationality_param, crse_code_param
			);
			
			RAISE NOTICE 'Student inserted successfully.';
		ELSE
			RAISE EXCEPTION 'Cannot insert student. Maximum course size exceeded.';
		END IF;
		
	EXCEPTION
		WHEN OTHERS THEN
		-- Rollback the transaction in case of an exception
		ROLLBACK;
		RAISE;
	END;
	-- The COMMIT keyword is stated here, but not necessary
	-- A transaction is implicitly committed when control reaches the end of
	-- the block without encountering an exception.
	-- Here, the outermost END serves as the implicit commit point.
	COMMIT;
END;
$$;

-- Modified Procedure
CREATE OR REPLACE PROCEDURE enrol_new_student(
	IN adm_no_param CHAR(4),
	IN stud_name_param VARCHAR(30),
	IN gender_param CHAR(1),
	IN address_param VARCHAR(100),
	IN dob_param DATE,
	IN nationality_param VARCHAR(30),
	IN crse_code_param VARCHAR(5),
	OUT err_msg VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
DECLARE
	max_size INTEGER;
	current_size INTEGER;
	current_crse_fee DECIMAL(7, 2);
	current_lab_fee DECIMAL(7, 2);
BEGIN
	-- Start the transaction
	BEGIN
		-- TODO: Fetch crse_fee and lab_fee in a single query
		SELECT crse_fee, lab_fee
		INTO current_crse_fee, current_lab_fee
		FROM course
		WHERE crse_code = crse_code_param;
		
		-- TODO: Insert records into payment_history for non-null fees
		IF current_crse_fee IS NOT NULL THEN
			INSERT INTO payment_history (payee_no, payment_date, amount_paid, fee_type)
			VALUES (
				adm_no_param, CURRENT_DATE, 0, 
				(SELECT fee_type FROM payment_fee_type WHERE fee_name = 'crse_fee')
			);
		END IF;

		IF current_lab_fee IS NOT NULL THEN
			INSERT INTO payment_history (payee_no, payment_date, amount_paid, fee_type)
			VALUES (
				adm_no_param, CURRENT_DATE, 0, 
				(SELECT fee_type FROM payment_fee_type WHERE fee_name = 'lab_fee')
			);
		END IF;

	EXCEPTION
		WHEN OTHERS THEN
		err_msg = 'Issues with payments';

	END;

	COMMIT;

	BEGIN
		-- TODO: Get the maximum course size for the specified course
		max_size := (SELECT max_crse_size FROM course WHERE crse_code = crse_code_param);
		
		-- TODO: Get the current number of students enrolled in the specified course
		current_size := (
			SELECT COUNT(*) FROM student
			WHERE crse_code = crse_code_param
		);
		
		IF -- TODO: Check if adding a new student exceeds the maximum course size
			current_size + 1 <= max_size
		THEN
			--TODO: Insert a new record into the student table
			INSERT INTO student (
				adm_no, stud_name, gender, address, dob, nationality, crse_code
			)
			VALUES
			(
				adm_no_param, stud_name_param, gender_param, address_param,
				dob_param, nationality_param, crse_code_param
			);
			
			RAISE NOTICE 'Student inserted successfully.';
		ELSE
			RAISE;
		END IF;
		
	EXCEPTION
		WHEN OTHERS THEN
		err_msg = 'Maximum course size exceeded. Please Handle Manually';
	END;
	-- The COMMIT keyword is stated here, but not necessary
	-- A transaction is implicitly committed when control reaches the end of
	-- the block without encountering an exception.
	-- Here, the outermost END serves as the implicit commit point.
	COMMIT;
END;
$$;



