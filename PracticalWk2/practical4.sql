-- Section A
-- Q1
SELECT citizenship FROM public.staff
ORDER BY citizenship DESC;

-- Q2
SELECT DISTINCT citizenship FROM public.staff
ORDER BY citizenship DESC;

-- Q3
SELECT dept_name as Department_Name, hod_appt_date as HOD_Appointment_Date
FROM public.department;

-- Q4
SELECT * FROM public.department
ORDER BY no_of_staff DESC;

-- Q5
SELECT staff_name as "Name of Staff", dob as "Date of Birth" FROM public.staff
ORDER BY "Date of Birth" ASC;

-- Q6
SELECT dept_code, staff_name FROM public.staff
ORDER BY dept_code DESC, staff_name DESC;

-- Section B
-- Q1
SELECT citizenship, staff_name FROM public.staff
WHERE citizenship != 'Singapore'
ORDER BY citizenship DESC, staff_name ASC;

-- Q2
SELECT staff_name as "Singaporean Male Staff" FROM public.staff
WHERE
	citizenship = 'Singapore' AND
	EXTRACT(YEAR FROM dob) >= 1960 AND 
	EXTRACT(YEAR FROM dob) <= 1969
ORDER BY staff_name ASC;

-- Q3
SELECT citizenship, staff_name FROM public.staff
WHERE
	citizenship IN ('Hong Kong', 'Korea', 'Malaysia', 'Thailand')
ORDER BY citizenship ASC;
	
-- Q4
SELECT dept_code, staff_name FROM public.staff
WHERE
	gender = 'F' OR
	dept_code IN ('SOC, DPO, SB')
ORDER BY staff_name ASC;

-- Q5
SELECT highest_qln, staff_name, designation FROM public.staff
WHERE 
	highest_qln LIKE 'B%' OR
	designation iLIKE '%deputy%'
ORDER BY highest_qln ASC, staff_name ASC; 

-- Q6
SELECT gender, pay, staff_name FROM public.staff
WHERE
	(gender = 'F' AND pay >= 4000 AND pay <= 7000) OR
	(gender = 'M' AND pay >= 2000 AND pay <= 6000)
ORDER BY gender ASC, pay ASC;

-- Q7
SELECT
	staff_no, staff_name, gender, dob,
	pay, grade, join_yr
FROM public.staff
WHERE
	gender = 'F' AND
	grade NOT IN ('SSD', 'SSE') AND
	(EXTRACT(YEAR FROM dob) < 1963 OR
	pay > 6000 OR
	(join_yr >= 1997 AND join_yr <= 2000))
ORDER BY staff_no ASC;




