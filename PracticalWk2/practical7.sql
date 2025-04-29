-- Section A
-- Q1
SELECT 
	dept_code, 
	AVG(pay) as "Mean Pay", 
	ROUND(SUM(pay), 2) as "Total Pay",
	COUNT(staff_no) as "No of Staff"
FROM staff
WHERE type_of_employment = 'FT'
GROUP BY dept_code
ORDER BY "No of Staff" ASC;

-- Q2
SELECT
	grade,
	AVG(pay) as "Mean Pay",
	ROUND(SUM(pay), 2) as "Total Pay",
	COUNT(staff_no) as "No of Staff"
FROM staff
WHERE type_of_employment = 'FT'
GROUP BY grade
ORDER BY "No of Staff" ASC;

-- Q2-modified
SELECT
	grade,
	AVG(pay) as "Mean Pay",
	ROUND(SUM(pay), 2) as "Total Pay",
	COUNT(staff_no) as "No of Staff"
FROM staff
WHERE 
	type_of_employment = 'FT'
GROUP BY grade
HAVING COUNT(staff_no) > 2
ORDER BY "No of Staff" ASC;

-- Q3
SELECT
	dept_code,
	MAX(pay) as "highest pay",
	MAX(allowance) as "highest allowance",
	MIN(pay) as "lowest pay",
	MIN(allowance) as "lowest allowance"
FROM staff
GROUP BY dept_code
ORDER BY dept_code ASC;

-- Q4
SELECT
	staff_name,
	COUNT(staff_name) as "Number of times staff name occurs"
FROM staff
GROUP BY staff_name
HAVING COUNT(staff_name) > 1;

-- Q5a
SELECT
	dept_code as Department,
	SUM(COALESCE(pay, 0) + COALESCE(allowance, 0)) as "Total Manpower Cost by Dept",
	COUNT(staff_no) as "No of Staff"
FROM staff
WHERE dept_code NOT IN ('DPO')
GROUP BY dept_code;

-- Q5b
SELECT
	dept_code as Department,
	SUM(COALESCE(pay, 0) + COALESCE(allowance, 0)) as "Total Manpower Cost by Dept",
	COUNT(staff_no) as "No of Staff"
FROM staff
WHERE 
	dept_code NOT IN ('DPO')
GROUP BY dept_code
HAVING SUM(COALESCE(pay, 0) + COALESCE(allowance, 0)) > 20000
ORDER BY "No of Staff" DESC;

-- Q6
SELECT
	SUBSTRING(staff_no FROM 1 for 1) as "By First Alphabet of Staff_no",
	COUNT(staff_no) as "Number of staff",
	AVG(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM dob)) as "Mean Age"
FROM staff
GROUP BY SUBSTRING(staff_no FROM 1 for 1)
ORDER BY "Number of staff" ASC;





