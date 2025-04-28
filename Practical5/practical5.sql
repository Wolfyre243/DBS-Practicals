-- Q1
SELECT crse_code, crse_name, crse_fee, COALESCE(lab_fee, 0), (crse_fee + COALESCE(lab_fee, 0)) as fee_per_sem FROM public.course
ORDER BY fee_per_sem DESC;

-- Q2
SELECT 
	staff_name, 
	(COALESCE(pay, 0) + COALESCE(allowance, 0)) as salary, 
	2.25 * (COALESCE(pay, 0) + COALESCE(allowance, 0)) as bonus 
FROM staff
ORDER BY bonus DESC;

-- Q3
SELECT 
	dept_name, 
	max_staff_strength, 
	no_of_staff, 
	(max_staff_strength - no_of_staff) as number_understaffed 
FROM department
ORDER BY number_understaffed DESC;

-- Q4
SELECT 
	CONCAT(staff_name, ' (', dept_code, ')') as staff_and_dept
FROM staff;

-- Q5
SELECT CURRENT_TIMESTAMP;

-- Q6
SELECT
	staff_name, 
	(DATE_PART('YEAR', CURRENT_TIMESTAMP) - join_yr) as years_in_service
FROM staff
ORDER BY years_in_service DESC;

-- Q7
SELECT 
	crse_code,
    UPPER(crse_name) AS "upper",
    LENGTH(crse_name) AS "length of diploma name"
FROM course
WHERE LENGTH(crse_name) > 32
ORDER BY LENGTH(crse_name) ASC;

-- Q8
SELECT
	staff_no, staff_name, 'No Supervisor' as supervisor
FROM staff
WHERE supervisor_staff_no IS NULL;







