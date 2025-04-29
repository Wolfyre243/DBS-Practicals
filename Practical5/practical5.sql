-- Q1
SELECT 
	crse_code, crse_name, crse_fee, 
	COALESCE(lab_fee, 0), 
	(crse_fee + COALESCE(lab_fee, 0)) as "fee per semester" 
FROM public.course
ORDER BY "fee per semester" DESC;

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
	(max_staff_strength - no_of_staff) as "number understaffed" 
FROM department
ORDER BY "number understaffed" DESC;

-- Q4
SELECT 
	CONCAT(staff_name, ' (', dept_code, ')') as "staff and department"
FROM staff
WHERE staff_no LIKE 'S%';

-- Q5
SELECT CURRENT_TIMESTAMP;

-- Q6
SELECT
	staff_name, 
	(DATE_PART('YEAR', CURRENT_TIMESTAMP) - join_yr) as "years in service"
FROM staff
ORDER BY "years in service" DESC;

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







