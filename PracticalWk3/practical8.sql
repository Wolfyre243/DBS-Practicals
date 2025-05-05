-- Q1
SELECT s.adm_no, s.stud_name, smp.mark, smp.grade
FROM student s
JOIN stud_mod_performance smp ON s.adm_no = smp.adm_no
WHERE smp.mod_registered = 'DBMS'
AND smp.mark > (
    SELECT AVG(mark)
    FROM stud_mod_performance
    WHERE mod_registered = 'DBMS'
)
ORDER BY smp.mark DESC;

-- Q2
SELECT s.citizenship, s.staff_name
FROM public.staff s
JOIN country
  ON s.citizenship = country.country_name
WHERE country.language = 'English'
ORDER BY s.citizenship, s.staff_name;

-- Q3
SELECT d.dept_code, d.dept_name, d.hod, d.no_of_staff, d.budget, d.expenditure, d.hod_appt_date 
FROM department d
JOIN staff s ON d.hod = s.staff_no
WHERE s.gender = 'F';

-- Q4
SELECT m.mod_code, m.mod_name, m.credit_unit, m.mod_coord
FROM public.module m
WHERE m.mod_code IN (
    SELECT DISTINCT p.mod_code
    FROM public.pre_requisite p
);

-- Q5
SELECT *
FROM public.staff s
WHERE s.dept_code IN (
SELECT d.dept_code
FROM public.staff s, public.department d
WHERE 
	d.hod = s.staff_no AND
	s.gender = 'F'
);

-- Q6
SELECT d.dept_name,
       COUNT(CASE WHEN s.pay > 5000 THEN 1 END) AS "Number of staff whose pay > $5000"
FROM public.department d
JOIN public.staff s ON d.dept_code = s.dept_code
WHERE s.type_of_employment = 'FT'
GROUP BY d.dept_name
HAVING COUNT(*) > 5;
