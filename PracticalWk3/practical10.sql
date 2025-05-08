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
FROM staff s
WHERE s.citizenship IN (
	SELECT country_name FROM country
	WHERE language = 'English'
)
ORDER BY s.citizenship ASC, s.staff_name ASC;

-- Q3
SELECT *
FROM department d
WHERE d.hod IN (
	SELECT s.staff_no FROM staff s
	WHERE s.gender = 'F'
);

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
SELECT d.dept_name, (
	SELECT COUNT(*) FROM staff s 
	WHERE s.dept_code = d.dept_code 
	  AND s.pay > 5000
) as "Number of staff whose pay > $5000"
FROM department d
GROUP BY d.dept_code
HAVING (
    SELECT COUNT(*) 
    FROM staff s 
    WHERE s.dept_code = d.dept_code 
      AND s.type_of_employment = 'FT'
) > 5;













