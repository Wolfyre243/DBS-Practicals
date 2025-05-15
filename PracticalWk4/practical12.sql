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

AS $$ 
DECLARE
	v_old_dept_code VARCHAR(5);
BEGIN

	v_old_dept_code = 
		SELECT dept_code FROM staff s
		WHERE s.staff_no = p_staff_no;

	UPDATE department d
	SET d.no_of_staff = d.no_of_staff + 1
	WHERE d.dept_code = v_old_dept_code

END;
$$
LANGUAGE plpgsql;







