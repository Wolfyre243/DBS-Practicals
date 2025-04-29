-- Section A
-- Q1
SELECT AVG(crse_fee) as "Mean Course Fee" FROM public.course;

-- Q2
SELECT AVG(COALESCE(lab_fee, 0)) as "Mean Lab Fee" FROM public.course;

-- Q3
SELECT AVG(crse_fee + COALESCE(lab_fee, 0)) as "Mean Total Fee"
FROM public.course;

-- Q4
SELECT SUM(pay) as "Total pay of SB Staff" FROM public.staff
WHERE dept_code = 'SB';

-- Q5
SELECT
	SUM(pay) as "Total Pay",
	SUM(allowance) as "Total Allowance",
	SUM(pay) + SUM(allowance),
	SUM(pay + allowance),
	SUM(COALESCE(pay, 0) + COALESCE(allowance, 0))
FROM public.staff;

-- Q6
SELECT COUNT(type_of_employment) as "Number of FT Staff"
FROM public.staff
WHERE type_of_employment = 'FT';

-- Q7
SELECT COUNT(lab_fee) as "Number of courses with lab fee"
FROM public.course;

-- Q8
SELECT COUNT(DISTINCT hourly_rate) as "Number of different hourly rate"
FROM public.staff;

-- Q9
SELECT
	MAX(pay) as "Highest Pay in SOC",
	MIN(pay) as "Lowest Pay in SOC"
FROM public.staff
WHERE dept_code = 'SOC';









